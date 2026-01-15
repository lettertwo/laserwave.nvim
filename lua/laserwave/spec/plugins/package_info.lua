local palette = require("laserwave.palette")

---@type laserwave.Spec
--stylua: ignore
local package_info = {
  PackageInfoOutdatedVersion = { fg = palette.ERROR },
  PackageInfoUpToDateVersion = { fg = palette.OK },
}

return package_info
