require "spices"
require "fibers_fabrics"
require "other_materials"

treasure_table = {
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
    ["2, 1, 1-3"] = {name="Household Items", weight=1, cost=10, qual=0, ench=0, decor=1, sup=0, qty=1},
    ["2, 1, 4"]   = {name="Household Items", weight=1, cost=10, qual=0, ench=1, decor=0, sup=0, qty=1},
    ["2, 1, 5"]   = {name="Household Items", weight=1, cost=10, qual=0, ench=1, decor=1, sup=0, qty=1},
    ["2, 1, 6"]   = {name="Household Items", weight=1, cost=10, qual=0, ench=1, decor=2, sup=0, qty=1},
    ["2, 2, 1"]   = {name="Household Items", weight=1, cost=10, qual=0, ench=1, decor=2, sup=1, qty=1},
    ["2, 2, 2"]   = {name="Household Items", weight=1, cost=10, qual=0, ench=2, decor=2, sup=0, qty=1},
    ["2, 2, 3"]   = {name="Household Items", weight=1, cost=10, qual=0, ench=2, decor=2, sup=1, qty=1},
    ["2, 2, 4"]   = {name="Household Items", weight=1, cost=10, qual=0, ench=0, decor=3, sup=0, qty=1},
    ["2, 2, 5"]   = {name="Household Items", weight=1, cost=10, qual=0, ench=1, decor=3, sup=0, qty=1},
    ["2, 2, 6"]   = {name="Household Items", weight=1, cost=10, qual=0, ench=1, decor=2, sup=0, qty=1},
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

expand_table(treasure_table)

function get_treasure(rollstr)
    local roll_result = roll_string(rollstr or "1d, 1d, 1d")
    local treasure_entry = treasure_table[roll_result]
    local items
    -- Get specific item
    if treasure_entry.cb then
        items = treasure_entry:cb()
    else
        items = {treasure_entry}
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
    for _,item in ipairs(items) do
        item.type = treasure_entry.name
        item.decorations = {}
        for _,decor in ipairs(decors) do
            table.insert(item.decorations, decor)
        end
        item.total_weight = item.weight
        item.cf = 0
        local decor_cost = 0
        -- Decorations do not add weight, contents do.
        if item.decorations then
            for i,decoration in ipairs(item.decorations) do
                if decoration.cf then
                    item.cf = item.cf + decoration.cf
                end
                if decoration.cost then
                    decor_cost = decor_cost + decoration.cost
                end
            end
        end
        item.total_cost = item.cost * (1 + item.cf) + decor_cost
        if item.contents then
            for i,content in ipairs(item.contents) do
                item.total_cost = item.total_cost + content.cost
                item.total_weight = item.total_weight + content.weight
            end
        end
    end
    return items
end
