#!/usr/bin/lua

local inspect = require "lib/inspect"

require "helpers"
require "treasure-table"

local seed = arg[2] or os.time()
math.randomseed(seed)

print("Rolled with seed "..seed)

local item_count = arg[1] or 10

local items = {}

for i=1, item_count do
    for _,v in ipairs(get_treasure("1-6, 1-6, 1-6")) do
        table.insert(items, v)
    end
end

print(inspect(stackify_table(items)))
