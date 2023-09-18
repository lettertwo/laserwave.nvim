local shipwright = require("shipwright")
local overwrite = require("shipwright.transform.overwrite")

local laserwave = require("laserwave")
local palette = require("laserwave.palette")
local kitty = require("laserwave.transform.kitty")

laserwave.setup()

shipwright.run(palette, kitty, { overwrite, "dist/kitty/laserwave.conf" })
