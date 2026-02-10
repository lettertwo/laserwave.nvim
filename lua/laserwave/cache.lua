---@module "laserwave.cache"
local M = {}

---@param flavor laserwave.FLAVOR
---@return string
function M.path(flavor)
  return vim.fn.stdpath("cache") .. "/laserwave-" .. flavor .. ".json"
end

---@param flavor laserwave.FLAVOR
---@return table?
function M.read(flavor)
  local ok, result = pcall(function()
    local path = M.path(flavor)
    local f = io.open(path, "r")
    if not f then
      return nil
    end
    local content = f:read("*a")
    f:close()
    return vim.json.decode(content)
  end)
  if ok then
    return result
  end
  return nil
end

---@param flavor laserwave.FLAVOR
---@param data table
function M.write(flavor, data)
  pcall(function()
    local path = M.path(flavor)
    local dir = vim.fn.fnamemodify(path, ":h")
    vim.fn.mkdir(dir, "p")
    local f = io.open(path, "w")
    if f then
      f:write(vim.json.encode(data))
      f:close()
    end
  end)
end

function M.clear()
  pcall(function()
    local dir = vim.fn.stdpath("cache")
    local files = vim.fn.glob(dir .. "/laserwave-*.json", false, true)
    for _, file in ipairs(files) do
      os.remove(file)
    end
  end)
end

return M
