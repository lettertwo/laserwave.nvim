-- clear module cache
for k, _ in pairs(package.loaded) do
  if k:match("^laserwave") or k:match("^shipwright") then
    package.loaded[k] = nil
  end
end

local shipwright = require("shipwright")
local overwrite = require("shipwright.transform.overwrite")

local laserwave = require("laserwave")
local palette = require("laserwave.transform.palette")
local kitty = require("laserwave.transform.kitty")
local alacritty = require("laserwave.transform.alacritty")

laserwave.setup()

shipwright.run(palette, kitty, { overwrite, "dist/kitty/laserwave.conf" })
shipwright.run(palette, alacritty, { overwrite, "dist/alacritty/laserwave.yml" })
