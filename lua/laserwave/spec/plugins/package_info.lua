local palette = require("laserwave.palette")

---@type LaserwaveSpec
--stylua: ignore
local package_info = {
  PackageInfoOutdatedVersion = { fg = palette.ERROR },
  PackageInfoUpToDateVersion = { fg = palette.OK },
}

return package_info
