local FlxG = require "interspecies-flixel.FlxG"
local Paths = require "funkin.backend.util.Paths"

---@class FunkinScript : class
local Script = class("Script")

function Script:init(file)
    self.env = {}

    -- global
    setmetatable(self.env, {__index = _G}) -- the "love" module is in there too!
    self.env.print = function(...)
        local i = debug.getinfo(2, "Sl")
        local l = i.currentline

        if ... ~= nil then
            print(file .. ":" .. l .. ": " .. ...)
        end
    end
    self.env.modrequire = function(p)
        local filename = p:gsub("%.", "/") .. ".lua"
        return Script(Paths.getFile("scripts/classes/" .. filename .. ".lua")).chunk()
    end

    -- flixel classes
    self.env.FlxG = require "interspecies-flixel.FlxG"

    self.env.FlxGroup = require "interspecies-flixel.group.FlxGroup"

    self.env.FlxMath = require "interspecies-flixel.math.FlxMath"
    self.env.FlxPoint = require "interspecies-flixel.math.FlxPoint"
    self.env.FlxRect = require "interspecies-flixel.math.FlxRect"

    self.env.FlxStringUtil = require "interspecies-flixel.util.FlxStringUtil"

    -- funkin' classes

    local chunk = love.filesystem.load(file)
    setfenv(chunk, self.env)
    self.chunk = chunk

    chunk()
end

function Script:set(var, val)
    self.env[var] = val
end

function Script:call(f, ...)
    -- todo: find a way to return what the script wants to return
    if self.env[f] and type(self.env[f]) == "function" then
        local s, e = pcall(self.env[f], ...)
        if not s then
            print(e)
            return
        end
    end
end

return Script