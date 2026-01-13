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
---@class Laserwave
local M = {}

---@alias LASERWAVE_FLAVOR_NAME "original" | "hi_c"

---@enum LASERWAVE_FLAVOR
M.flavors = { original = 1, hi_c = 2 }

---@type LASERWAVE_FLAVOR
M._flavor = M.flavors.original

---@param input LASERWAVE_FLAVOR | LASERWAVE_FLAVOR_NAME
function M.set_flavor(input)
  ---@type LASERWAVE_FLAVOR | nil
  local flavor
  if type(input == "string") then
    flavor = M.flavors[input] or nil
  else
    for _, id in pairs(M.flavors) do
      if id == input then
        flavor = id
        break
      end
    end
  end

  if flavor == nil then
    vim.notify("Invalid flavor: " .. input, vim.log.levels.ERROR, { title = "Laserwave" })
  elseif flavor ~= M._flavor then
    M._flavor = flavor
    local name = M.get_flavor(flavor)
    if name == "original" then
      vim.cmd.colorscheme("laserwave")
    else
      vim.cmd.colorscheme("laserwave-" .. name)
    end
  end
end

---@param input ?(LASERWAVE_FLAVOR | LASERWAVE_FLAVOR_NAME)
---@return LASERWAVE_FLAVOR_NAME
function M.get_flavor(input)
  local flavor
  if type(input == "string") then
    flavor = M.flavors[input] or nil
  else
    flavor = input
  end
  flavor = flavor or M._flavor

  for name, id in pairs(M.flavors) do
    if id == flavor then
      return name
    end
  end

  error("Invalid flavor: " .. input)
end

---@return ParsedLaserwaveConfig
function M.get_config()
  local cfg = M._config
  if not cfg then
    M.setup()
    cfg = M._config
  end
  assert(cfg ~= nil, "Config not initialized")
  return cfg
end

---@param config ?LaserwaveConfig
function M.set_config(config)
  ---@diagnostic disable-next-line: param-type-mismatch
  M._config = require("laserwave.config").parse(vim.tbl_deep_extend("force", M._config or {}, config or {}))
end

---@param config ?LaserwaveConfig
function M.setup(config)
  M.set_config(config)

  vim.api.nvim_create_user_command("Laserwave", function(input)
    -- TODO: Support more commands, like toggling options on/off.
    M.set_flavor(input.args)
  end, {
    nargs = 1,
    complete = function(line)
      return vim.tbl_filter(function(val)
        return vim.startswith(val, line)
      end, vim.tbl_keys(M.flavors))
    end,
  })
end

return M
