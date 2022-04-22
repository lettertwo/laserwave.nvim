package.loaded["laserwave.palette"] = nil
package.loaded["laserwave.transform.kitty"] = nil

local shipwright = require("shipwright")
local lush = require("shipwright.transform.lush")
local overwrite = require("shipwright.transform.overwrite")

local palette = require("laserwave.palette")
local kitty = require("laserwave.transform.kitty")

shipwright.run(palette, kitty, { overwrite, "dist/kitty/laserwave.conf" })
