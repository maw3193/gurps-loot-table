require "spices"
require "fibers_fabrics"
require "other_materials"
require "household-items"
require "supernatural-embellishment"
require "enchantment"
local inspect = require "lib/inspect"

treasure_table = expand_table{
    ["1, 1, 1-5"] = {name="Spices", weight=1, cost=10, qual=0, ench=0, decor=0, sup=0, qty=1, cb=get_contained_spice},
    ["1, 1, 6"]   = {name="Spices", weight=1, cost=10, qual=0, ench=0, decor=1, sup=0, qty=1, cb=get_contained_spice},
    ["1, 2, 1-2"] = {name="Spices", weight=1, cost=10, qual=0, ench=0, decor=0, sup=0, qty=2, cb=get_contained_spice},
    ["1, 2, 3"]   = {name="Spices", weight=1, cost=10, qual=0, ench=0, decor=1, sup=0, qty=2, cb=get_contained_spice},
    ["1, 2, 4-5"] = {name="Spices", weight=1, cost=10, qual=0, ench=0, decor=0, sup=0, qty=3, cb=get_contained_spice},
    ["1, 2, 6"]   = {name="Spices", weight=1, cost=10, qual=0, ench=0, decor=1, sup=0, qty=3, cb=get_contained_spice},
    ["1, 3, 1-6"] = {name="Fibers and Fabrics", weight=1, cost=10, qual=0, ench=0, decor=0, sup=0, qty=1, cb=get_fabric},
    ["1, 4, 1-3"] = {name="Fibers and Fabrics", weight=1, cost=10, qual=0, ench=0, decor=0, sup=0, qty=2, cb=get_fabric},
    ["1, 4, 4-6"] = {name="Fibers and Fabrics", weight=1, cost=10, qual=0, ench=0, decor=0, sup=0, qty=3, cb=get_fabric},
    ["1, 5, 1-5"] = {name="Other Materials", weight=1, cost=10, qual=0, ench=0, decor=0, sup=0, qty=1, cb=get_other_material},
    ["1, 5, 6"]   = {name="Other Materials", weight=1, cost=10, qual=0, ench=0, decor=1, sup=0, qty=1, cb=get_other_material},
    ["1, 6, 1-2"] = {name="Other Materials", weight=1, cost=10, qual=0, ench=0, decor=0, sup=0, qty=2, cb=get_other_material},
    ["1, 6, 3"]   = {name="Other Materials", weight=1, cost=10, qual=0, ench=0, decor=1, sup=0, qty=2, cb=get_other_material},
    ["1, 6, 4-5"] = {name="Other Materials", weight=1, cost=10, qual=0, ench=0, decor=0, sup=0, qty=3, cb=get_other_material},
    ["1, 6, 6"]   = {name="Other Materials", weight=1, cost=10, qual=0, ench=0, decor=1, sup=0, qty=3, cb=get_other_material},
    ["2, 1, 1-3"] = {name="Household Items", weight=1, cost=10, qual=0, ench=0, decor=1, sup=0, qty=1, cb=get_household_item},
    ["2, 1, 4"]   = {name="Household Items", weight=1, cost=10, qual=0, ench=1, decor=0, sup=0, qty=1, cb=get_household_item},
    ["2, 1, 5"]   = {name="Household Items", weight=1, cost=10, qual=0, ench=1, decor=1, sup=0, qty=1, cb=get_household_item},
    ["2, 1, 6"]   = {name="Household Items", weight=1, cost=10, qual=0, ench=1, decor=2, sup=0, qty=1, cb=get_household_item},
    ["2, 2, 1"]   = {name="Household Items", weight=1, cost=10, qual=0, ench=1, decor=2, sup=1, qty=1, cb=get_household_item},
    ["2, 2, 2"]   = {name="Household Items", weight=1, cost=10, qual=0, ench=2, decor=2, sup=0, qty=1, cb=get_household_item},
    ["2, 2, 3"]   = {name="Household Items", weight=1, cost=10, qual=0, ench=2, decor=2, sup=1, qty=1, cb=get_household_item},
    ["2, 2, 4"]   = {name="Household Items", weight=1, cost=10, qual=0, ench=0, decor=3, sup=0, qty=1, cb=get_household_item},
    ["2, 2, 5"]   = {name="Household Items", weight=1, cost=10, qual=0, ench=1, decor=3, sup=0, qty=1, cb=get_household_item},
    ["2, 2, 6"]   = {name="Household Items", weight=1, cost=10, qual=0, ench=1, decor=2, sup=0, qty=1, cb=get_household_item},
    ["2, 3, 1-2"] = {name="Garments", weight=1, cost=10, qual=0, ench=0, decor=1, sup=0, qty=1},
    ["2, 3, 3-4"] = {name="Garments", weight=1, cost=10, qual=0, ench=1, decor=0, sup=0, qty=1},
    ["2, 3, 5"]   = {name="Garments", weight=1, cost=10, qual=0, ench=1, decor=1, sup=0, qty=1},
    ["2, 3, 6"]   = {name="Garments", weight=1, cost=10, qual=0, ench=1, decor=2, sup=0, qty=1},
    ["2, 4, 1"]   = {name="Garments", weight=1, cost=10, qual=0, ench=1, decor=2, sup=1, qty=1},
    ["2, 4, 2"]   = {name="Garments", weight=1, cost=10, qual=0, ench=2, decor=2, sup=0, qty=1},
    ["2, 4, 3"]   = {name="Garments", weight=1, cost=10, qual=0, ench=2, decor=2, sup=1, qty=1},
    ["2, 4, 4"]   = {name="Garments", weight=1, cost=10, qual=0, ench=0, decor=3, sup=0, qty=1},
    ["2, 4, 5"]   = {name="Garments", weight=1, cost=10, qual=0, ench=1, decor=3, sup=0, qty=1},
    ["2, 4, 6"]   = {name="Garments", weight=1, cost=10, qual=0, ench=2, decor=2, sup=0, qty=1},
    ["2, 5, 1"]   = {name="Jewelry", weight=1, cost=10, qual=0, ench=0, decor=0, sup=0, qty=1},
    ["2, 5, 2"]   = {name="Jewelry", weight=1, cost=10, qual=0, ench=1, decor=0, sup=0, qty=1},
    ["2, 5, 3"]   = {name="Jewelry", weight=1, cost=10, qual=0, ench=2, decor=0, sup=0, qty=1},
    ["2, 5, 4"]   = {name="Jewelry", weight=1, cost=10, qual=0, ench=0, decor=0, sup=0, qty=2},
    ["2, 5, 5"]   = {name="Jewelry", weight=1, cost=10, qual=0, ench=1, decor=0, sup=0, qty=2},
    ["2, 5, 6"]   = {name="Jewelry", weight=1, cost=10, qual=0, ench=2, decor=0, sup=0, qty=2},
    ["2, 6, 1"]   = {name="Jewelry", weight=1, cost=10, qual=0, ench=0, decor=0, sup=0, qty=2},
    ["2, 6, 2"]   = {name="Jewelry", weight=1, cost=10, qual=0, ench=1, decor=0, sup=1, qty=2},
    ["2, 6, 3"]   = {name="Jewelry", weight=1, cost=10, qual=0, ench=2, decor=0, sup=1, qty=2},
    ["2, 6, 4-5"] = {name="Gems", weight=1, cost=10, qual=0, ench=0, decor=0, sup=0, qty=1},
    ["2, 6, 6"]   = {name="Gems", weight=1, cost=10, qual=0, ench=1, decor=0, sup=0, qty=1},
    ["3, 1, 1"]   = {name="Gems", weight=1, cost=10, qual=0, ench=2, decor=0, sup=0, qty=1},
    ["3, 1, 2"]   = {name="Gems", weight=1, cost=10, qual=0, ench=0, decor=0, sup=0, qty=2},
    ["3, 1, 3"]   = {name="Gems", weight=1, cost=10, qual=0, ench=1, decor=0, sup=0, qty=2},
    ["3, 1, 4"]   = {name="Gems", weight=1, cost=10, qual=0, ench=2, decor=0, sup=0, qty=2},
    ["3, 1, 5"]   = {name="Gems", weight=1, cost=10, qual=0, ench=0, decor=0, sup=0, qty=2},
    ["3, 1, 6"]   = {name="Gems", weight=1, cost=10, qual=0, ench=1, decor=0, sup=1, qty=2},
    ["3, 2, 1"]   = {name="Gems", weight=1, cost=10, qual=0, ench=2, decor=0, sup=1, qty=2},
    ["3, 2, 2-3"] = {name="Containers", weight=1, cost=10, qual=0, ench=0, decor=1, sup=0, qty=1},
    ["3, 2, 4-5"] = {name="Containers", weight=1, cost=10, qual=0, ench=1, decor=1, sup=0, qty=1},
    ["3, 2, 6"]   = {name="Containers", weight=1, cost=10, qual=0, ench=1, decor=2, sup=0, qty=1},
    ["3, 3, 1"]   = {name="Containers", weight=1, cost=10, qual=0, ench=1, decor=2, sup=1, qty=1},
    ["3, 3, 2"]   = {name="Containers", weight=1, cost=10, qual=0, ench=2, decor=2, sup=0, qty=1},
    ["3, 3, 3"]   = {name="Containers", weight=1, cost=10, qual=0, ench=2, decor=2, sup=1, qty=1},
    ["3, 3, 4"]   = {name="Containers", weight=1, cost=10, qual=0, ench=0, decor=3, sup=0, qty=1},
    ["3, 3, 5"]   = {name="Containers", weight=1, cost=10, qual=0, ench=1, decor=3, sup=0, qty=1},
    ["3, 3, 6"]   = {name="Containers", weight=1, cost=10, qual=0, ench=2, decor=2, sup=0, qty=1},
    ["3, 4, 1-2"] = {name="Accoutrements", weight=1, cost=10, qual=0, ench=0, decor=0, sup=0, qty=1},
    ["3, 4, 3-5"] = {name="Accoutrements", weight=1, cost=10, qual=0, ench=0, decor=1, sup=0, qty=1},
    ["3, 4, 6"]   = {name="Accoutrements", weight=1, cost=10, qual=0, ench=1, decor=1, sup=0, qty=1},
    ["3, 5, 1"]   = {name="Accoutrements", weight=1, cost=10, qual=0, ench=1, decor=1, sup=0, qty=1},
    ["3, 5, 2"]   = {name="Accoutrements", weight=1, cost=10, qual=0, ench=1, decor=2, sup=0, qty=1},
    ["3, 5, 3"]   = {name="Accoutrements", weight=1, cost=10, qual=0, ench=1, decor=2, sup=1, qty=1},
    ["3, 5, 4"]   = {name="Accoutrements", weight=1, cost=10, qual=0, ench=2, decor=2, sup=0, qty=1},
    ["3, 5, 5"]   = {name="Accoutrements", weight=1, cost=10, qual=0, ench=2, decor=2, sup=1, qty=1},
    ["3, 5, 6"]   = {name="Accoutrements", weight=1, cost=10, qual=0, ench=2, decor=2, sup=0, qty=1},
    ["3, 6, 1"]   = {name="Books, Maps", weight=1, cost=10, qual=0, ench=0, decor=1, sup=0, qty=1},
    ["3, 6, 2"]   = {name="Books, Maps", weight=1, cost=10, qual=0, ench=1, decor=1, sup=0, qty=1},
    ["3, 6, 3"]   = {name="Books, Maps", weight=1, cost=10, qual=0, ench=1, decor=2, sup=0, qty=1},
    ["3, 6, 4"]   = {name="Books, Maps", weight=1, cost=10, qual=0, ench=1, decor=2, sup=1, qty=1},
    ["3, 6, 5"]   = {name="Books, Maps", weight=1, cost=10, qual=0, ench=2, decor=2, sup=0, qty=1},
    ["3, 6, 6"]   = {name="Books, Maps", weight=1, cost=10, qual=0, ench=2, decor=2, sup=1, qty=1},
    ["4, 1, 1"]   = {name="Books, Maps", weight=1, cost=10, qual=0, ench=0, decor=3, sup=0, qty=1},
    ["4, 1, 2"]   = {name="Books, Maps", weight=1, cost=10, qual=0, ench=1, decor=3, sup=0, qty=1},
    ["4, 1, 3"]   = {name="Books, Maps", weight=1, cost=10, qual=0, ench=2, decor=2, sup=0, qty=1},
    ["4, 1, 4-6"] = {name="Scrolls", weight=1, cost=10, qual=0, ench=0, decor=0, sup=0, qty=1},
    ["4, 2, 1-6"] = {name="Scrolls", weight=1, cost=10, qual=0, ench=0, decor=0, sup=0, qty=1},
    ["4, 3, 1"]   = {name="Basic Set Melee", weight=1, cost=10, qual=0, ench=0, decor=1, sup=0, qty=1},
    ["4, 3, 2"]   = {name="Basic Set Melee", weight=1, cost=10, qual=1, ench=0, decor=0, sup=0, qty=1},
    ["4, 3, 3"]   = {name="Basic Set Melee", weight=1, cost=10, qual=1, ench=0, decor=1, sup=0, qty=1},
    ["4, 3, 4"]   = {name="Basic Set Melee", weight=1, cost=10, qual=0, ench=1, decor=1, sup=0, qty=1},
    ["4, 3, 5"]   = {name="Basic Set Melee", weight=1, cost=10, qual=1, ench=1, decor=1, sup=0, qty=1},
    ["4, 3, 6"]   = {name="Basic Set Melee", weight=1, cost=10, qual=0, ench=1, decor=2, sup=0, qty=1},
    ["4, 4, 1"]   = {name="Basic Set Melee", weight=1, cost=10, qual=1, ench=1, decor=2, sup=1, qty=1},
    ["4, 4, 2"]   = {name="Basic Set Melee", weight=1, cost=10, qual=0, ench=2, decor=2, sup=0, qty=1},
    ["4, 4, 3"]   = {name="Basic Set Melee", weight=1, cost=10, qual=1, ench=2, decor=2, sup=1, qty=1},
    ["4, 4, 4"]   = {name="Basic Set Melee", weight=1, cost=10, qual=2, ench=0, decor=2, sup=0, qty=1},
    ["4, 4, 5"]   = {name="Basic Set Melee", weight=1, cost=10, qual=2, ench=1, decor=2, sup=0, qty=1},
    ["4, 4, 6"]   = {name="Basic Set Melee", weight=1, cost=10, qual=1, ench=2, decor=2, sup=1, qty=1},
    ["4, 5, 1"]   = {name="Mart. Arts Melee", weight=1, cost=10, qual=0, ench=0, decor=1, sup=0, qty=1},
    ["4, 5, 2"]   = {name="Mart. Arts Melee", weight=1, cost=10, qual=1, ench=0, decor=0, sup=0, qty=1},
    ["4, 5, 3"]   = {name="Mart. Arts Melee", weight=1, cost=10, qual=1, ench=0, decor=1, sup=0, qty=1},
    ["4, 5, 4"]   = {name="Mart. Arts Melee", weight=1, cost=10, qual=0, ench=1, decor=1, sup=0, qty=1},
    ["4, 5, 5"]   = {name="Mart. Arts Melee", weight=1, cost=10, qual=1, ench=1, decor=1, sup=0, qty=1},
    ["4, 5, 6"]   = {name="Mart. Arts Melee", weight=1, cost=10, qual=0, ench=1, decor=2, sup=0, qty=1},
    ["4, 6, 1"]   = {name="Mart. Arts Melee", weight=1, cost=10, qual=1, ench=1, decor=2, sup=1, qty=1},
    ["4, 6, 2"]   = {name="Mart. Arts Melee", weight=1, cost=10, qual=0, ench=2, decor=2, sup=0, qty=1},
    ["4, 6, 3"]   = {name="Mart. Arts Melee", weight=1, cost=10, qual=1, ench=2, decor=2, sup=1, qty=1},
    ["4, 6, 4"]   = {name="Mart. Arts Melee", weight=1, cost=10, qual=2, ench=0, decor=2, sup=0, qty=1},
    ["4, 6, 5"]   = {name="Mart. Arts Melee", weight=1, cost=10, qual=2, ench=1, decor=2, sup=0, qty=1},
    ["4, 6, 6"]   = {name="Mart. Arts Melee", weight=1, cost=10, qual=1, ench=2, decor=2, sup=1, qty=1},
    ["5, 1, 1"]   = {name="Basic Set Missile", weight=1, cost=10, qual=0, ench=0, decor=1, sup=0, qty=1},
    ["5, 1, 2"]   = {name="Basic Set Missile", weight=1, cost=10, qual=1, ench=0, decor=0, sup=0, qty=1},
    ["5, 1, 3"]   = {name="Basic Set Missile", weight=1, cost=10, qual=1, ench=0, decor=1, sup=0, qty=1},
    ["5, 1, 4"]   = {name="Basic Set Missile", weight=1, cost=10, qual=0, ench=1, decor=1, sup=0, qty=1},
    ["5, 1, 5"]   = {name="Basic Set Missile", weight=1, cost=10, qual=1, ench=1, decor=1, sup=0, qty=1},
    ["5, 1, 6"]   = {name="Basic Set Missile", weight=1, cost=10, qual=0, ench=1, decor=2, sup=0, qty=1},
    ["5, 2, 1"]   = {name="Basic Set Missile", weight=1, cost=10, qual=1, ench=1, decor=2, sup=1, qty=1},
    ["5, 2, 2"]   = {name="Basic Set Missile", weight=1, cost=10, qual=0, ench=2, decor=2, sup=0, qty=1},
    ["5, 2, 3"]   = {name="Basic Set Missile", weight=1, cost=10, qual=1, ench=2, decor=2, sup=1, qty=1},
    ["5, 2, 4"]   = {name="Basic Set Missile", weight=1, cost=10, qual=2, ench=0, decor=2, sup=0, qty=1},
    ["5, 2, 5"]   = {name="Basic Set Missile", weight=1, cost=10, qual=2, ench=1, decor=2, sup=0, qty=1},
    ["5, 2, 6"]   = {name="Basic Set Missile", weight=1, cost=10, qual=1, ench=2, decor=2, sup=1, qty=1},
    ["5, 3, 1"]   = {name="Mart. Arts Missile", weight=1, cost=10, qual=0, ench=0, decor=1, sup=0, qty=1},
    ["5, 3, 2"]   = {name="Mart. Arts Missile", weight=1, cost=10, qual=1, ench=0, decor=0, sup=0, qty=1},
    ["5, 3, 3"]   = {name="Mart. Arts Missile", weight=1, cost=10, qual=1, ench=0, decor=1, sup=0, qty=1},
    ["5, 3, 4"]   = {name="Mart. Arts Missile", weight=1, cost=10, qual=0, ench=1, decor=1, sup=0, qty=1},
    ["5, 3, 5"]   = {name="Mart. Arts Missile", weight=1, cost=10, qual=1, ench=1, decor=1, sup=0, qty=1},
    ["5, 3, 6"]   = {name="Mart. Arts Missile", weight=1, cost=10, qual=0, ench=1, decor=2, sup=0, qty=1},
    ["5, 4, 1"]   = {name="Mart. Arts Missile", weight=1, cost=10, qual=1, ench=1, decor=2, sup=1, qty=1},
    ["5, 4, 2"]   = {name="Mart. Arts Missile", weight=1, cost=10, qual=0, ench=2, decor=2, sup=0, qty=1},
    ["5, 4, 3"]   = {name="Mart. Arts Missile", weight=1, cost=10, qual=1, ench=2, decor=2, sup=1, qty=1},
    ["5, 4, 4"]   = {name="Mart. Arts Missile", weight=1, cost=10, qual=2, ench=0, decor=2, sup=0, qty=1},
    ["5, 4, 5"]   = {name="Mart. Arts Missile", weight=1, cost=10, qual=2, ench=1, decor=2, sup=0, qty=1},
    ["5, 4, 6"]   = {name="Mart. Arts Missile", weight=1, cost=10, qual=1, ench=2, decor=2, sup=1, qty=1},
    ["5, 5, 1"]   = {name="Armor", weight=1, cost=10, qual=0, ench=0, decor=1, sup=0, qty=1},
    ["5, 5, 2"]   = {name="Armor", weight=1, cost=10, qual=1, ench=0, decor=0, sup=0, qty=1},
    ["5, 5, 3"]   = {name="Armor", weight=1, cost=10, qual=1, ench=0, decor=1, sup=0, qty=1},
    ["5, 5, 4"]   = {name="Armor", weight=1, cost=10, qual=0, ench=1, decor=1, sup=0, qty=1},
    ["5, 5, 5"]   = {name="Armor", weight=1, cost=10, qual=1, ench=1, decor=1, sup=0, qty=1},
    ["5, 5, 6"]   = {name="Armor", weight=1, cost=10, qual=0, ench=1, decor=2, sup=0, qty=1},
    ["5, 6, 1"]   = {name="Armor", weight=1, cost=10, qual=1, ench=1, decor=2, sup=1, qty=1},
    ["5, 6, 2"]   = {name="Armor", weight=1, cost=10, qual=0, ench=2, decor=2, sup=0, qty=1},
    ["5, 6, 3"]   = {name="Armor", weight=1, cost=10, qual=1, ench=2, decor=2, sup=1, qty=1},
    ["5, 6, 4"]   = {name="Armor", weight=1, cost=10, qual=2, ench=0, decor=2, sup=0, qty=1},
    ["5, 6, 5"]   = {name="Armor", weight=1, cost=10, qual=2, ench=1, decor=2, sup=0, qty=1},
    ["5, 6, 6"]   = {name="Armor", weight=1, cost=10, qual=1, ench=2, decor=2, sup=1, qty=1},
    ["6, 1, 1"]   = {name="Shields", weight=1, cost=10, qual=0, ench=0, decor=1, sup=0, qty=1},
    ["6, 1, 2"]   = {name="Shields", weight=1, cost=10, qual=1, ench=0, decor=0, sup=0, qty=1},
    ["6, 1, 3"]   = {name="Shields", weight=1, cost=10, qual=1, ench=0, decor=1, sup=0, qty=1},
    ["6, 1, 4"]   = {name="Shields", weight=1, cost=10, qual=0, ench=1, decor=1, sup=0, qty=1},
    ["6, 1, 5"]   = {name="Shields", weight=1, cost=10, qual=1, ench=1, decor=1, sup=0, qty=1},
    ["6, 1, 6"]   = {name="Shields", weight=1, cost=10, qual=0, ench=1, decor=2, sup=0, qty=1},
    ["6, 2, 1"]   = {name="Shields", weight=1, cost=10, qual=1, ench=1, decor=2, sup=1, qty=1},
    ["6, 2, 2"]   = {name="Shields", weight=1, cost=10, qual=0, ench=2, decor=2, sup=0, qty=1},
    ["6, 2, 3"]   = {name="Shields", weight=1, cost=10, qual=1, ench=2, decor=2, sup=1, qty=1},
    ["6, 2, 4"]   = {name="Shields", weight=1, cost=10, qual=2, ench=0, decor=2, sup=0, qty=1},
    ["6, 2, 5"]   = {name="Shields", weight=1, cost=10, qual=2, ench=1, decor=2, sup=0, qty=1},
    ["6, 2, 6"]   = {name="Shields", weight=1, cost=10, qual=1, ench=2, decor=2, sup=1, qty=1},
    ["6, 3-4, 1-6"]={name="Concoctions", weight=1, cost=10, qual=0, ench=0, decor=0, sup=0, qty=1},
    ["6, 5, 1-6"] = {name="Unusual Items", weight=1, cost=10, qual=0, ench=0, decor=0, sup=0, qty=1},
    ["6, 6, 1-2"] = {name="Unusual Items", weight=1, cost=10, qual=0, ench=0, decor=0, sup=0, qty=1},
    ["6, 6, 3-6"] = {name="Rare Artifacts", weight=1, cost=10, qual=0, ench=0, decor=0, sup=0, qty=1},
}

all_items_table = {}

function deduplicate_item(item)
    local itemstr = inspect(item)
    if all_items_table[itemstr] then
        return all_items_table[itemstr]
    else
        all_items_table[itemstr] = item
        return item
    end
end

function get_treasure(rollstr)
    local roll_result = roll_string(rollstr or "1d, 1d, 1d")
    local treasure_entry = treasure_table[roll_result]
    local items
    -- Get specific item
    if treasure_entry.cb then
        items = treasure_entry:cb()
    else
         return {treasure_entry}
    end
    -- Get decorations
    local decors = {}
    if treasure_entry.decor > 0 then
        for i=1, treasure_entry.decor do
            local d = get_decoration(items[1].soft)
            for j,decor in ipairs(d) do
                table.insert(decors, decor)
            end
        end
    end

    -- Get Enchantments and Curses
    local enchants = {}
    local curses = {}
    if treasure_entry.ench > 0 then
        -- first item in list determines what enchantments will be
        enchants, curses = get_enchantments(items[1], treasure_entry.ench)
    end

    -- Get supernatural embellishments, I'm only expecting one
    local supernaturals = {}
    if treasure_entry.sup > 0 then
        for i=1, treasure_entry.sup do
            table.insert(supernaturals, get_supernatural_embellishment())
        end
    end

    for i,item in ipairs(items) do
        item.type = treasure_entry.name
        item.decorations = item.decorations or {}
        for _,decor in ipairs(decors) do
            table.insert(item.decorations, decor)
        end
        item.enchants = item.enchants or {}
        for _,ench in ipairs(enchants) do
            table.insert(item.enchants, ench)
        end
        item.supernaturals = item.supernaturals or {}
        for _,sup in ipairs(supernaturals) do
            table.insert(item.supernaturals, sup)
        end
        item.total_weight = item.weight
        item.cf = item.cf or 0
        local decor_cost = 0
        -- Decorations do not add weight, contents do.
        for _,decoration in ipairs(item.decorations) do
            if decoration.cf then
                item.cf = item.cf + decoration.cf
            end
            if decoration.cost then
                decor_cost = decor_cost + decoration.cost
            end
        end
        for _,supernatural in ipairs(item.supernaturals) do
            item.cf = item.cf + supernatural.cf
        end
        item.total_cost = item.cost * (1 + item.cf) + decor_cost
        if item.contents then
            for i,content in ipairs(item.contents) do
                item.total_cost = item.total_cost + content.cost
                item.total_weight = item.total_weight + content.weight
            end
        end
        items[i] = deduplicate_item(item)
    end
    return items
end
