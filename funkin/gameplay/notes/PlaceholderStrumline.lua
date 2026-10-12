-- todo: once FlxSprite and FlxCamera is implemented, remove this and reimplement the strums

local FlxG = require "interspecies-flixel.FlxG"

local PlaceholderStrumline = class("PlaceholderStrumline")

function PlaceholderStrumline:init(song, pos)
    self.songPosition = 0

    self.x = 0
    self.scrollSpeed = 1
    self.notes = {}

    self:load(song, pos)
end

function PlaceholderStrumline:load(data, pos)
    self.scrollSpeed = data.chart.speed
    self.notes = data.chart.notes[pos]
end

function PlaceholderStrumline:draw()
    for i = 0, 3 do
        love.graphics.rectangle("line", self.x + (i * 112), 50, 96, 96)
    end

    for _, note in pairs(self.notes) do
        local y = (note.time - self.songPosition) * (0.45 * self.scrollSpeed)
        if y < FlxG.height then
            if note.length > 0 then
                local length = note.length * (0.45 * self.scrollSpeed)
                love.graphics.setColor(1, 1, 1, 0.5)
                love.graphics.rectangle("fill", self.x + ((note.lane - 1) * 112), 50 + math.max(0, y), 96, (y >= 0 and length or math.max(0, y + length)))
            end
            if y >= 0 then
                love.graphics.setColor(1, 1, 1, 1)
                love.graphics.rectangle("fill", self.x + ((note.lane - 1) * 112), 50 + y, 96, 96)
            end
        end
    end
    love.graphics.setColor(1, 1, 1, 1)
end

return PlaceholderStrumline