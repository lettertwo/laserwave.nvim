-- clear module cache
for k, _ in pairs(package.loaded) do
  if k:match("^laserwave") or k:match("^lush") or k:match("^shipwright") then
    package.loaded[k] = nil
  end
end

local lush = require("lush")
local shipwright = require("shipwright")
local overwrite = require("shipwright.transform.overwrite")
local patchwrite = require("shipwright.transform.patchwrite")
local lushwright = require("shipwright.transform.lush")

---@type Laserwave
local laserwave = require("laserwave")

local transforms = {
  lualine = require("laserwave.transform.lualine"),
  kitty = require("laserwave.transform.kitty"),
  alacritty = require("laserwave.transform.alacritty"),
  colorscheme = require("laserwave.transform.colorscheme"),
}

laserwave.setup()

---@param name ?FLAVOR_NAME
local function build_flavor(name)
  local config = vim.tbl_extend("force", laserwave._config, { flavor = name })
  local colorscheme = name ~= "original" and "laserwave-" .. name or "laserwave"
  local colorspath = "colors/" .. colorscheme .. ".lua"

  -- clear specs from module cache
  for k, _ in pairs(package.loaded) do
    if k:match("^laserwave.spec") then
      vim.notify("Unloading " .. k, vim.log.levels.DEBUG, { title = "Laserwave" })
      package.loaded[k] = nil
    end
  end

  require("laserwave.spec.flavor").set(config.flavor)

  local specs = {
    spec = lush.merge({
      require("laserwave.spec.syntax"),
      require("laserwave.spec.ui"),
      require("laserwave.spec.terminal"),
    }),
    treesitter = require("laserwave.spec.treesitter"),
    semantic_highlights = require("laserwave.spec.semantic_highlights"),
  }

  for plugin in pairs(config.plugins) do
    local plugin_ok, plugin_spec = pcall(require, "laserwave.spec.plugins." .. plugin)
    if plugin_ok then
      specs[plugin] = plugin_spec
    else
      vim.notify("Failed to load plugin: " .. plugin, vim.log.levels.ERROR, { title = "Laserwave" })
    end
  end

  -- TODO: Move this to the template
  -- spec = lush.extends(specs).with(function()
  --   ---@diagnostic disable: undefined-global
  --   --stylua: ignore start
  --   return {
  --     Normal     { spec.Normal,     bg =  config.options.transparent and "NONE" or spec.Normal.bg },
  --     Comment    { spec.Comment,    gui = config.options.italic_comments and "italic" or "NONE" },
  --     Function   { spec.Function,   gui = config.options.italic_functions and "italic" or "NONE" },
  --     Statement  { spec.Statement,  gui = config.options.italic_keywords and "italic" or "NONE" },
  --     Identifier { spec.Identifier, gui = config.options.italic_variables and "italic" or "NONE" },
  --   }
  --   --stylua: ignore end
  -- end)

  local ctx = vim.tbl_extend("force", specs.spec, { name = colorscheme })

  shipwright.run(ctx, transforms.lualine, { overwrite, "lua/lualine/themes/" .. colorscheme .. ".lua" })
  shipwright.run(ctx, transforms.kitty, { overwrite, "dist/kitty/" .. colorscheme .. ".conf" })
  shipwright.run(ctx, transforms.alacritty, { overwrite, "dist/alacritty/" .. colorscheme .. ".yml" })
  shipwright.run(ctx, transforms.colorscheme, { overwrite, colorspath })

  local result = {}

  for spec_name, spec in pairs(specs) do
    local start = "--%% begin " .. spec_name .. " %%--"
    local stop = "--%% end " .. spec_name .. " %%--"

    local build_ok, err = pcall(shipwright.run, spec, lushwright.to_lua, { patchwrite, colorspath, start, stop })

    result[spec_name] = build_ok

    if not build_ok then
      vim.notify("Failed to build " .. spec_name .. "\n" .. err, vim.log.levels.ERROR, { title = "Laserwave" })
    end
  end

  return result
end

local result = {}
for name, _ in pairs(laserwave.flavors) do
  result[name] = build_flavor(name)
end

vim.notify("Built " .. vim.inspect(result), vim.log.levels.INFO, { title = "Laserwave" })
