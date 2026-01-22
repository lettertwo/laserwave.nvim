---@type laserwave.Groups
--stylua: ignore
local occurrence = {
  OccurrenceMatch   = "Visual", -- Default is Search
  OccurrenceMark    = { underline = true }, -- Default is IncSearch
  OccurrenceCurrent = { underline = true, reverse = true }, -- Default is CurSearch
}

return occurrence
