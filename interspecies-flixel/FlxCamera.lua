-- TODO: finish this, then work on FlxSprite

local FlxG = require "interspecies-flixel.FlxG"
local FlxBasic = require "interspecies-flixel.FlxBasic"

local FlxCamera = FlxBasic:extend("FlxCamera")

function FlxCamera:init(x, y, w, h, zoom)
    x = x or 0
    y = y or 0
    w = w or 0
    h = h or 0
    zoom = zoom or 0

    FlxCamera.super.init(self)

    self.x, self.y = x, y
    self.width = w <= 0 and FlxG.width or w
    self.height = h <= 0 and FlxG.height or h

    self.zoom = zoom
end

return FlxCamera