--                  (&&&&&&&&&&&&&&&&&&&(
--             ,&&&&&&&&&&&&&&&&&&&&&&&&&&&&&,
--          &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
--        &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
--      &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
--    &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
--   &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
--  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
--
-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
--
-- *%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*
--
--   ###################################################
--
--     ###############################################
--       ###########################################
--
--            #######(#############(##########(
--
--       _      _   ___ ___ _____      _____   _____
--      | |    /_\ / __| __| _ \ \    / /_\ \ / / __|
--      | |__ / _ \\__ \ _||   /\ \/\/ / _ \ V /| _|
--      |____/_/ \_\___/___|_|_\ \_/\_/_/ \_\_/ |___|
--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--
---@class Laserwave
local M = {}

---@alias FLAVOR_NAME "original" | "hi_c"

---@enum FLAVOR
M.flavors = { original = 1, hi_c = 2 }

---@param input ?(FLAVOR | FLAVOR_NAME)
---@return FLAVOR_NAME | nil
function M.get_flavor(input)
  local flavor
  if type(input == "string") then
    flavor = M.flavors[input] or nil
  else
    flavor = input
  end
  flavor = flavor or M._options.flavor

  for name, id in pairs(M.flavors) do
    if id == flavor then
      return name
    end
  end

  vim.notify("Invalid flavor: " .. input, vim.log.levels.ERROR, { title = "Laserwave" })
end

---@return ParsedConfig
function M.get_config()
  local cfg = M._config
  if not cfg then
    M.setup(M._options)
    cfg = M._config
  end
  assert(cfg ~= nil, "Config not initialized")
  return cfg
end

---@param options ?Config
function M.setup(options)
  -- TODO: Figure out how to apply config without a compile step
  -- TODO: figure out how to choose the right colorscheme without requiring user to explicitly set it.

  M._options = options
  ---@type ParsedConfig
  M._config = require("laserwave.config").parse(options)

  vim.api.nvim_create_user_command("Laserwave", function(inp)
    local name = M.get_flavor(inp.args)
    if name ~= nil and M.flavors[name] ~= nil then
      if name == "original" then
        vim.api.nvim_command("colorscheme laserwave")
      else
        vim.api.nvim_command("colorscheme laserwave-" .. name)
      end
    end
  end, {
    nargs = 1,
    complete = function(line)
      return vim.tbl_filter(function(val)
        return vim.startswith(val, line)
      end, vim.tbl_keys(M.flavors))
    end,
  })

  if M._config.debug then
    -- TODO: Make this stuff work again

    -- require("laserwave.spec.flavor").set(M._config.flavor)
    --
    -- M._spec = require("laserwave.config").apply({
    --   require("laserwave.spec.syntax"),
    --   require("laserwave.spec.ui"),
    -- }, M._config)

    -- vim.api.nvim_create_user_command("LaserwaveCompile", function()
    --   for name, _ in pairs(package.loaded) do
    --     if name:match("^laserwave.") then
    --       vim.notify("Unloading " .. name, vim.log.levels.DEBUG, { title = "Laserwave" })
    --       package.loaded[name] = nil
    --     end
    --   end
    --   M._spec = nil
    --   require("laserwave.compiler").compile()
    --   vim.notify("Reloaded!", vim.log.levels.INFO, { title = "Laserwave" })
    --   vim.cmd.colorscheme("laserwave")
    -- end, {})
    --
    -- vim.api.nvim_create_autocmd("BufWritePost", {
    --   group = vim.api.nvim_create_augroup("laserwave", { clear = true }),
    --   pattern = "*/laserwave/*",
    --   callback = function()
    --     vim.schedule(function()
    --       vim.cmd("LaserwaveCompile")
    --     end)
    --   end,
    -- })
  end
end

return M
