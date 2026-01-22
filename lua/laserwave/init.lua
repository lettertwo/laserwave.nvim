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

---@param opts ?laserwave.Options
function M.setup(opts)
  if M._config ~= nil then
    for name, _ in pairs(package.loaded) do
      if name:match("^laserwave.flavor") or name:match("^laserwave.palette") or name:match("^laserwave.groups") then
        vim.notify("Unloading " .. name, vim.log.levels.DEBUG, { title = "Laserwave" })
        package.loaded[name] = nil
      end
    end
  end

  M._config = require("laserwave.config").parse(opts)
  local flavor = M._config.flavor or "original"
  vim.cmd.colorscheme(flavor == "original" and "laserwave" or "laserwave-" .. flavor)
end

local command_initialized = false

-- Create the main `:Laserwave` command with subcommands
local function init_command()
  local command = require("laserwave.command")

  if not command_initialized then
    command.add("flavor", {
      nargs = 1,
      impl = function(args)
        local config = M.get_config()
        local flavor = args[1]
        config.flavor = flavor
        local ok, err = pcall(require("laserwave.config").validate, config)
        if not ok then
          vim.notify(tostring(err), vim.log.levels.WARN, { title = "Laserwave" })
        else
          M.setup(config)
          vim.notify(string.format("Set flavor to %s", flavor), vim.log.levels.INFO, { title = "Laserwave" })
        end
      end,
      complete = function(line)
        return vim.tbl_filter(function(val)
          return vim.startswith(val, line)
        end, vim.tbl_keys(require("laserwave.flavor").flavors))
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

        local ok, err = pcall(require("laserwave.config").validate, config)
        if not ok then
          vim.notify(tostring(err), vim.log.levels.WARN, { title = "Laserwave" })
        else
          M.setup(config)
          vim.notify(
            string.format("Toggled %s to %s", key, tostring(target_config[key])),
            vim.log.levels.INFO,
            { title = "Laserwave" }
          )
        end
      end,
      complete = function()
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

    command.add("syntax_mode", {
      nargs = 1,
      impl = function(args)
        local mode = args[1]
        local config = M.get_config()
        config.syntax_mode = mode
        local ok, err = pcall(require("laserwave.config").validate, config)
        if not ok then
          vim.notify(tostring(err), vim.log.levels.WARN, { title = "Laserwave" })
        else
          M.setup(config)
          vim.notify(string.format("Set syntax_mode to %s", mode), vim.log.levels.INFO, { title = "Laserwave" })
        end
      end,
      complete = function()
        return vim.tbl_keys(require("laserwave.config").SYNTAX_MODE)
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
