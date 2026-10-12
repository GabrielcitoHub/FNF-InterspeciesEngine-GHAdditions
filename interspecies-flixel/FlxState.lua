local FlxGroup = require "interspecies-flixel.group.FlxGroup"

local FlxState = FlxGroup:extend("FlxState")

function FlxState:create() end

function FlxState:switchTo(state)
    return true
end

return FlxState