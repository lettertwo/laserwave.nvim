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
---@class laserwave
local M = {}

---@alias laserwave.FLAVOR_NAME "original" | "hi_c"

---@enum laserwave.FLAVOR
M.flavors = { original = 1, hi_c = 2 }

---@type laserwave.FLAVOR
M._flavor = M.flavors.original

---@param input laserwave.FLAVOR | laserwave.FLAVOR_NAME
function M.set_flavor(input)
  ---@type laserwave.FLAVOR | nil
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
  else
    M._flavor = flavor
    local name = M.get_flavor(flavor)
    if name == "original" then
      vim.cmd.colorscheme("laserwave")
    else
      vim.cmd.colorscheme("laserwave-" .. name)
    end
  end
end

---@param input ?(laserwave.FLAVOR | laserwave.FLAVOR_NAME)
---@return laserwave.FLAVOR_NAME
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

---@return laserwave.Config
function M.get_config()
  local cfg = M._config
  if not cfg then
    M.setup()
    cfg = M._config
  end
  assert(cfg ~= nil, "Config not initialized")
  return cfg:clone()
end

local command_initialized = false

-- Create the main `:Laserwave` command with subcommands
local function init_command()
  local command = require("laserwave.command")

  if not command_initialized then
    command.add("flavor", {
      nargs = 1,
      impl = function(args)
        M.set_flavor(args[1])
      end,
      complete = function(line)
        return vim.tbl_filter(function(val)
          return vim.startswith(val, line)
        end, vim.tbl_keys(M.flavors))
      end,
    })

    command.add("toggle", {
      nargs = 1,
      impl = function(args)
        local config = M.get_config()
        local target_config = config
        local key = args[1]

        if config[key] == nil then
          if config.plugins[key] ~= nil then
            target_config = config.plugins
          else
            vim.notify(
              string.format("Config key %s does not exist", key),
              vim.log.levels.ERROR,
              { title = "Laserwave" }
            )
            return
          end
        end

        if type(target_config[key]) ~= "boolean" then
          vim.notify(
            string.format("Config key %s is not a boolean", key),
            vim.log.levels.ERROR,
            { title = "Laserwave" }
          )
          return
        end

        target_config[key] = not target_config[key]
        M.setup(config)

        vim.notify(
          string.format("Toggled %s to %s", key, tostring(target_config[key])),
          vim.log.levels.INFO,
          { title = "Laserwave" }
        )
      end,
      complete = function(line)
        local config = M.get_config()
        local keys = {}
        for key, val in pairs(config) do
          if type(val) == "boolean" then
            table.insert(keys, key)
          end
        end
        for key, val in pairs(config.plugins) do
          if type(val) == "boolean" then
            table.insert(keys, key)
          end
        end
        return keys
      end,
    })

    vim.api.nvim_create_user_command("Laserwave", command.execute, {
      nargs = "+",
      range = 0,
      force = true,
      desc = "Laserwave command",
      complete = command.complete,
    })
    command_initialized = true
  end

  return command
end

---@param opts ?laserwave.Options
function M.setup(opts)
  M._config = require("laserwave.config").parse(opts)
  M.set_flavor(M.get_flavor())
end

-- Set up a stub command that will load the full command on first use
vim.api.nvim_create_user_command("Laserwave", function(...)
  return init_command().execute(...)
end, {
  nargs = "+",
  range = 0,
  force = true,
  desc = "Laserwave command",
  complete = function(...)
    return init_command().complete(...)
  end,
})

return M
