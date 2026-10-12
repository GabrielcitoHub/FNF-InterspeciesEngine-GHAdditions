local FlxG = class("FlxG")

FlxG.state = nil

function FlxG:setup(g, w, h)
    self.game = g
    self.width = w
    self.height = h
end

return FlxG