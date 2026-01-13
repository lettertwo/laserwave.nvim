local palette = require("laserwave.spec.palette")

---@type LaserwaveSpec
--stylua: ignore
local package_info = {
  PackageInfoOutdatedVersion = { fg = palette.ERROR },
  PackageInfoUpToDateVersion = { fg = palette.SUCCESS },
}

return package_info
