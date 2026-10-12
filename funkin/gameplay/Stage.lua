local Paths = require "funkin.backend.util.Paths"
local Script = require "funkin.backend.scripting.Script"
local FlxGroup = require "interspecies-flixel.group.FlxGroup"

local Stage = class("Stage")

function Stage:init(name)
    self.script = Script(Paths.getPath("scripts/stages/" .. name .. ".lua", "file"))

    self.background = FlxGroup()
    self.foreground = FlxGroup()

    self.script:set("self", self)
end

function Stage:add(obj, fg)
    local layer = fg and self.foreground or self.background
    layer:add(obj)
end

return Stage