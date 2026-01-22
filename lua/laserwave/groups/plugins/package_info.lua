local palette = require("laserwave.palette")

---@type laserwave.Groups
--stylua: ignore
local package_info = {
  PackageInfoOutdatedVersion = { fg = palette.ERROR },
  PackageInfoUpToDateVersion = { fg = palette.OK },
}

return package_info
