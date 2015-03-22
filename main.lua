#!/usr/bin/lua

local inspect = require "lib/inspect"

require "helpers"
require "treasure-table"

local seed = arg[2] or os.time()
math.randomseed(seed)

print("Rolled with seed "..seed)

local item_count = arg[1] or 10

for i=1, item_count do
    print("Item "..i..": "..inspect(get_treasure("1d, 1d, 1d")))
    --print(inspect(get_spice{qty=math.random(1, 3),
    --                        decor=math.random(0, 2)}))
end


