#!/usr/bin/lua

require "helpers"
require "treasure-table"

math.randomseed(os.time())
local item_count = arg[1] or 10

for i=1, item_count do
    --print(write_item(get_treasure()))
    print(write_item(get_spice{qty=math.random(1, 3),
                               decor=math.random(0, 2)}))
end


