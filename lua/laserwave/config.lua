local lush = require("lush")
-- local base = require("laserwave.base")

-- shim vim for generators
vim = vim or { g = {}, o = {} }

local function opt(key, default)
  key = "laserwave_" .. key
  if vim.g[key] == nil then
    return default
  end
  if vim.g[key] == 0 then
    return false
  end
  return vim.g[key]
end

---@class Options
---@field transparent ?boolean
---@field italic_comments ?boolean
---@field italic_functions ?boolean
---@field italic_keywords ?boolean
---@field italic_variables ?boolean

---@class Config
---@field options ?Options

---@class ParsedOptions
---@field transparent boolean
---@field italic_comments boolean
---@field italic_functions boolean
---@field italic_keywords boolean
---@field italic_variables boolean

---@class ParsedConfig
---@field options ParsedOptions

---@class DefaultConfig
local config = {
  ---@type ParsedOptions
  options = {
    transparent = opt("transparent", false),
    italic_comments = opt("italic_comments", true),
    italic_keywords = opt("italic_keywords", true),
    italic_functions = opt("italic_functions", false),
    italic_variables = opt("italic_variables", false),
  },
  -- plugins = {},
  -- langs = {}
}

---@param base ParsedLushSpec
---@param config_table ?Config
---@return ParsedLushSpec
-- function config.apply(base, config_table)
function config.apply(base, config_table)
  ---@type ParsedOptions
  local o = config.options
  if config_table and config_table.options then
    o = vim.fn.extend("force", o, config_table.options)
  end
  return lush.extends({ base }).with(function()
    -- LSP/Linters mistakenly show `undefined global` errors in the spec.
    ---@diagnostic disable: undefined-global
    --stylua: ignore
    return {
      Normal     { base.Normal,     bg = o.transparent and "NONE" or base.Normal.bg },
      Comment    { base.Comment,    gui = o.italic_comments and "italic" or "NONE" },
      Function   { base.Function,   gui = o.italic_functions and "italic" or "NONE" },
      Statement  { base.Statement,  gui = o.italic_keywords and "italic" or "NONE" },
      Identifier { base.Identifier, gui = o.italic_variables and "italic" or "NONE" },
      TSVariable { base.TSVariable, gui = o.italic_variables and "italic" or "NONE" },
      TSKeyword  { base.TSKeyword,  gui = o.italic_keywords and "italic" or "NONE" },
    }
  end)
end

return config

-- vi:nowrap
