---@module "laserwave.command"
local command = {}

---@class laserwave.SubcommandArgs: string[]

---@class laserwave.Subcommand
---@field impl fun(args: laserwave.SubcommandArgs) The command implementation
-- :h command-completion-custom
---@field complete? fun(subcmd_arg_lead: string, cursorpos: integer): string[] (optional) Command completions callback, taking the lead of the subcommand's arguments

---@type { [string]: laserwave.Subcommand }
local subcommands = {}

---@param name string
---@param opts laserwave.Subcommand
function command.add(name, opts)
  vim.validate("name", name, "string")
  vim.validate("opts", opts, "table")
  vim.validate("impl", opts.impl, "function")
  vim.validate("complete", opts.complete, "function", true)
  subcommands[name] = opts
end

---@param opts vim.api.keyset.create_user_command.command_args :h lua-guide-commands-create
function command.execute(opts)
  local fargs = opts.fargs
  local subcommand_key = fargs[1]
  local subcommand = subcommands[subcommand_key]
  if not subcommand then
    vim.notify(string.format("Unknown command: %s", subcommand_key), vim.log.levels.ERROR, { title = "Laserwave" })
    return
  end
  local args = #fargs > 1 and { unpack(fargs, 2) } or {}
  local range = opts.range -- The number of items in the command range: 0, 1 or 2
  if range == 1 then
    args.count = opts.count
  elseif range == 2 then
    local Range = require("laserwave.Range")
    args.range = Range.new(Range.of_line(opts.line1 - 1).start, Range.of_line(opts.line2 - 1).stop)
  end
  subcommand.impl(args)
end

---@param arglead string The leading portion of the argument being completed
---@param cmdline string The entire command line
---@param cursorpos integer The cursor position in the command line
---@return string[]? A list of completion matches
function command.complete(arglead, cmdline, cursorpos)
  local subcommand_key, subcommand_arglead = cmdline:match("^['<,'>]*%S+[!]*%s+(%S*)%s(.*)$")
  if subcommand_key and subcommands[subcommand_key] and subcommands[subcommand_key].complete then
    return subcommands[subcommand_key].complete(subcommand_arglead, cursorpos)
  elseif arglead and not subcommand_key or not subcommands[subcommand_key] then
    -- `:Laserwave <TAB>` or `:Laserwave <subcommand> <TAB>`
    return vim.tbl_keys(subcommands)
  end
end

return command
