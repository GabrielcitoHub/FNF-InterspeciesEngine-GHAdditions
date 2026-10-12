local FlxMath = {}

function FlxMath.roundDecimal(v, p)
    a = 10 ^ p
    return math.round(v * a) / a
end

function FlxMath.bound(v, min, max)
    return math.max(math.min(v, max), min)
end

function FlxMath.lerp(a, b, t)
    return a + t * (b - a)
end

function FlxMath.wrap(v, min, max)
    local range = max - min + 1

    if v < min then
        v = v + (range * math.floor((min - v) / range + 1))
    end

    return min + (v - min) % range
end

function FlxMath.remapToRange(v, t1, d1, t2, d2)
    return t2 + (v - t1) * ((d2 - t2) / (t1 - d1))
end

return FlxMath