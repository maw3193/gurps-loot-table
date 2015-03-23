require "helpers"

containers_table = {
    ["1, 1-2"] = {name="Amphora", cost=60, weight=40, soft=false},
    ["1, 3-4"] = {name="Barrel", cost=65, weight=20, soft=false},
    ["1, 5-6"] = {name="Basket", cost=1.75, weight=1.5, soft=true},
    ["2, 1-2"] = {name="Bottle/Jar", cost=3, weight=1, soft=false},
    ["2, 3-4"] = {name="Bottle/Jar, Small", cost=2, weight=0.5, soft=false},
    ["2, 5"]   = {name="Box, Stone, Large", cost=1000, weight=220, soft=false},
    ["2, 6"]   = {name="Box, Stone, Small", cost=50, weight=6, soft=false},
    ["3, 1"]   = {name="Box, Wood, Large", cost=15, weight=2, soft=false},
    ["3, 2"]   = {name="Box, Wood, Small", cost=2, weight=0.25, soft=false},
    ["3, 3"]   = {name="Cabinet", cost=150, weight=30, soft=false},
    ["3, 4"]   = {name="Cabinet, Compartmentalized", cost=200, weight=16, soft=false},
    ["4, 1"]   = {name="Cage, Large", cost=120, weight=7, soft=false},
    ["4, 2"]   = {name="Cage, Small", cost=40, weight=3, soft=false},
    ["4, 3"]   = {name="Cage, Small, Wood", cost=20, weight=2, soft=false},
    ["4, 4"]   = {name="Canteen, Wood, 1 quart", cost=10, weight=3, soft=false},
    ["4, 5"]   = {name="Chest", cost=200, weight=40, soft=false},
    ["5, 1"]   = {name="Chest, Compartmentalized", cost=300, weight=45, soft=false},
    ["5, 2-3"] = {name="Chest, Small", cost=100, weight=18, soft=false},
    ["5, 4-5"] = {name="Chest, Small, Compartmentalized", cost=120, weight=20, soft=false},
    ["5, 6"]   = {name="Strongbox, Iron", cost=250, weight=15, soft=false},
    ["6, 1"]   = {name="Strongbox, Iron, Compartmentalized", cost=300, weight=18, soft=false},
    ["6, 2"]   = {name="Vial, Crystal", cost=5, weight=0.25, soft=false},
    ["6, 3"]   = {name="Vial, Iron", cost=15, weight=0.5, soft=false},
    ["6, 4"]   = {name="Wineskin, 1 Gallon", cost=10, weight=0.25, soft=true},
    ["6, 5"]   = {name="Cushioned", cf=1},
    ["6, 6"]   = {name="Secret Compartment", cf=2}
}

expand_table(containers_table)

container_vial = containers_table["6, 2"]
container_bottle_small = containers_table["2, 3"]
container_bottle = containers_table["2, 1"]
container_barrel = containers_table["1, 3"]
container_box = containers_table["3, 1"]
