#!/usr/bin/lua

require "helpers"
local treasure = require "treasure-table"

math.randomseed(os.time())

--print(roll("1d, 1d, 1d"))

--print(write_item(get_item()))
print(write_table(expand_table(treasure)))
