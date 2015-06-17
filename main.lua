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
    item_returned = false
    for _,v in ipairs(get_treasure("2, 2, 2")) do
        item_returned = true
        table.insert(items, v)
    end
    if not item_returned then
        error("i="..i..", ERROR! No item returned")
    end
end

print(inspect(stackify_table(items)))
