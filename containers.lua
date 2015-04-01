require "helpers"

-- Capacity is in pounds, assuming density of water.
-- how many ounces of water makes 1 pound?
-- 1 pound is 16 ounces

containers_table = {
    ["1, 1-2"] = {name="Amphora",                            cost=60, weight=40, soft=false, capacity=48, sealed=true},
    ["1, 3-4"] = {name="Barrel",                             cost=65, weight=20, soft=false, capacity=40, sealed=true},
    ["1, 5-6"] = {name="Basket",                             cost=1.75, weight=1.5, soft=true, capacity=60, sealed=false},
    ["2, 1-2"] = {name="Bottle/Jar",                         cost=3, weight=1, soft=false, capacity=2, sealed=true},
    ["2, 3-4"] = {name="Bottle/Jar, Small",                  cost=2, weight=0.5, soft=false, capacity=1, sealed=true},
    ["2, 5"]   = {name="Box, Stone, Large",                  cost=1000, weight=220, soft=false, capacity=400, sealed=false},
    ["2, 6"]   = {name="Box, Stone, Small",                  cost=50, weight=6, soft=false, capacity=150, sealed=false},
    ["3, 1"]   = {name="Box, Wood, Large",                   cost=15, weight=2, soft=false, capacity=150, sealed=false},
    ["3, 2"]   = {name="Box, Wood, Small",                   cost=2, weight=0.25, soft=false, capacity=1, sealed=false},
    ["3, 3"]   = {name="Cabinet",                            cost=150, weight=30, soft=false, capacity=700, sealed=false},
    ["3, 4"]   = {name="Cabinet, Compartmentalized",         cost=200, weight=16, soft=false, capacity=700, sealed=false},
    ["4, 1"]   = {name="Cage, Large",                        cost=120, weight=7, soft=false, capacity=175, sealed=false},
    ["4, 2"]   = {name="Cage, Small",                        cost=40, weight=3, soft=false, capacity=10, sealed=false},
    ["4, 3"]   = {name="Cage, Small, Wood",                  cost=20, weight=2, soft=false, capacity=10, sealed=false},
    ["4, 4"]   = {name="Canteen, Wood, 1 quart",             cost=10, weight=3, soft=false, capacity=2, sealed=true},
    ["4, 5"]   = {name="Chest",                              cost=200, weight=40, soft=false, capacity=400, sealed=false},
    ["5, 1"]   = {name="Chest, Compartmentalized",           cost=300, weight=45, soft=false, capacity=400, sealed=false},
    ["5, 2-3"] = {name="Chest, Small",                       cost=100, weight=18, soft=false, capacity=100, sealed=false},
    ["5, 4-5"] = {name="Chest, Small, Compartmentalized",    cost=120, weight=20, soft=false, capacity=100, sealed=false},
    ["5, 6"]   = {name="Strongbox, Iron",                    cost=250, weight=15, soft=false, capacity=100, sealed=false},
    ["6, 1"]   = {name="Strongbox, Iron, Compartmentalized", cost=300, weight=18, soft=false, capacity=100, sealed=false},
    ["6, 2"]   = {name="Vial, Crystal",                      cost=5, weight=0.25, soft=false, capacity=6.25, sealed=true},
    ["6, 3"]   = {name="Vial, Iron",                         cost=15, weight=0.5, soft=false, capacity=6.25, sealed=true},
    ["6, 4"]   = {name="Wineskin, 1 Gallon",                 cost=10, weight=0.25, soft=true, capacity=100, sealed=true},
    ["6, 5"]   = {name="Cushioned", cf=1},
    ["6, 6"]   = {name="Secret Compartment", cf=2}
}

containers_by_capacity_table = {}
for k,v in pairs(containers_table) do
    if v.capacity then
        table.insert(containers_by_capacity_table, v)
    end
end

table.sort(containers_by_capacity_table, function(a, b)
    if a.capacity == b.capacity then
        return a.cost < b.cost
    else
        return a.capacity < b.capacity
    end
end)

expand_table(containers_table)

container_vial = containers_table["6, 2"]
container_bottle_small = containers_table["2, 3"]
container_bottle = containers_table["2, 1"]
container_barrel = containers_table["1, 3"]
container_box = containers_table["3, 1"]

function get_smallest_suitable_container(size, is_fluid)
    for i,v in ipairs(containers_by_capacity_table) do
        if (v.sealed or not is_fluid) and size <= v.capacity then
            return v
        end
    end
    return nil
end

function get_largest_suitable_container(size, is_fluid)
    local largest_container = nil
    for i,v in ipairs(containers_by_capacity_table) do
        if v.sealed or not is_fluid then
            largest_container = v
        end
    end
    if v == nil then
        print ("WARNING: get_largest_suitable_container found nothing!")
    end
    return v
end
