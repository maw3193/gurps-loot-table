-- Global namespace pollution with function names. I don't care.

function get_item()
    return {name="generic item", cf=0, weight=1, cost=10}
end

function write_item(item)
    return item.name..", "..item.weight.."lbs, $"..item.cost
end

function roll_dice(y)
    return math.random(1, y)
end

function sum_dice(x, y)
    local sum = 0
    for i=1,x do
        sum = sum + roll_dice(y)
    end
    return sum
end

function roll(dice) --dice of form "1d, 1d, 1d"
    -- XdY
    local startpos, endpos, x, y = dice:find("(%d+)d(%d+)")
    if (startpos and endpos and x and y) then
        return roll(dice:sub(1, startpos - 1)
                    .. sum_dice(x, y)
                    .. dice:sub(endpos + 1))
    end
    -- Nd
    local startpos, endpos, n = dice:find("(%d+)d")
    if (startpos and endpos and n) then
        return roll(dice:sub(1, startpos - 1)
                    .. sum_dice(n, 6)
                    .. dice:sub(endpos + 1))
    end
    -- A + B
    local startpos, endpos, a, b = dice:find("(%d+)%s*+%s*(%d+)")
    if (startpos and endpos and a and b) then
        return roll(dice:sub(1, startpos - 1)
                    .. a + b
                    .. dice:sub(endpos + 1))
    end
    -- A - B
    local startpos, endpos, a, b = dice:find("(%d+)%s*-%s*(%d+)")
    if (startpos and endpos and a and b) then
        return roll(dice:sub(1, startpos - 1)
                    .. a - b
                    .. dice:sub(endpos + 1))
    end
    
    return dice
end

function expand_table(table)
    local had_expansion = false
    for k,v in pairs(table) do
        -- a-b (interpolation)
        local startpos, endpos, a, b = k:find("(%d+)-(%d+)")
        if (startpos and endpos and a and b) then
            for i=a, b do
                local newindex = k:sub(1, startpos - 1)
                                 .. i .. k:sub(endpos + 1)
                table[newindex] = v
            had_expansion = true
            end
            table[k] = nil
        end
    end

    if had_expansion then
        return expand_table(table)
    else
        return table
    end
end

function write_table(t)
    local lines = {}
    for k,v in pairs(t) do
        table.insert(lines, string.format("%s: %s\n", k, v.name))
    end
    return table.concat(lines)
end
