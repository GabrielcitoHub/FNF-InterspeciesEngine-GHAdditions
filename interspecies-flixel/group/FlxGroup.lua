local FlxBasic = require "interspecies-flixel.FlxBasic"

local FlxGroup = FlxBasic:extend("FlxGroup")

function FlxGroup:init(maxSize)
    FlxGroup.super.init(self)

    self.members = {}
    self.maxSize = maxSize or 0
    self.length = 0
end

function FlxGroup:destroy()
    FlxGroup.super.destroy(self)

    if self.members ~= nil then
        for _, basic in pairs(self.members) do
            if basic ~= nil then
                basic:destroy()
            end
        end

        self.members = nil
    end
end

function FlxGroup:update(dt)
    if self.members ~= nil then
        for _, basic in pairs(self.members) do
            if basic ~= nil and basic.exists and basic.alive then
                basic:update(dt)
            end
        end
    end
end

function FlxGroup:add(obj)
    if obj == nil then
        return nil
    end

    if table.indexOf(self.members, obj) >= 1 then
        return obj
    end

    local index = self:getFirstNil()
    if index ~= 0 then
        self.members[index] = obj
        if index >= self.length then
            self.length = index + 1
        end

        return obj
    end

    if self.maxSize > 0 and self.length >= self.maxSize then
        return obj
    end

    table.insert(self.members, obj)
    self.length = self.length + 1

    return obj
end

function FlxGroup:getFirstNil()
    for i = 1, self.length do
        if self.members[i] == nil then
            return i
        end
    end
    return 0
end

return FlxGroup