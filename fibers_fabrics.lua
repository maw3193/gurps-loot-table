require "races"

common_animals_table = expand_table{
    ["1-3, 1"] = "Seal",
    ["1-3, 2"] = "Monkey",
    ["1-3, 3"] = "Rabbit",
    ["1-3, 4"] = "Fox",
    ["1-3, 5"] = "Goat",
    ["1-3, 6"] = "Horse",
    ["4-6, 1"] = "Ox",
    ["4-6, 2"] = "Deer",
    ["4-6, 3"] = "Elk",
    ["4-6, 4"] = "Reindeer",
    ["4-6, 5"] = "Antelope",
    ["4-6, 6"] = "Ibex"
}

function get_common_animal_item(fabric_entry, suffix)
    local animal = common_animals_table[roll_string("1d, 1d")]
    local item = {
        name = animal..suffix,
        cost = fabric_entry.cost,
        weight = fabric_entry.weight
    }
    return item
end

function get_common_fur(fabric_entry)
    return get_common_animal_item(fabric_entry, " Fur")
end

function get_common_leather(fabric_entry)
    return get_common_animal_item(fabric_entry, " Leather")
end

exotic_animals_table = expand_table{
    ["1-3, 1"] = "Sable",
    ["1-3, 2"] = "Ermine",
    ["1-3, 3"] = "Jaguar",
    ["1-3, 4"] = "Lion",
    ["1-3, 5"] = "Tiger",
    ["1-3, 6"] = "Wolf",
    ["4-6, 1"] = "Bear",
    ["4-6, 2"] = "Wyvern",
    ["4-6, 3"] = "Dire Wolf",
    ["4-6, 4"] = "Cave Bear",
    ["4-6, 5"] = "Giant Ape",
    ["4-6, 6"] = "Frost Snake"
}

function get_exotic_animal_item(fabric_entry, suffix)
    local animal = exotic_animals_table[roll_string("1d, 1d")]
    local item = {
        name = animal..suffix,
        cost = fabric_entry.cost,
        weight = fabric_entry.weight
    }
    return item
end

function get_exotic_fur(fabric_entry)
    return get_exotic_animal_item(fabric_entry, " Fur")
end

function get_exotic_leather(fabric_entry)
    return get_exotic_animal_item(fabric_entry, " Leather")
end

function get_contraband_leather(fabric_entry)
    local item = {
        name = get_race() .. " Leather",
        cost = fabric_entry.cost,
        weight = fabric_entry.weight
    }
    return item
end

function get_fiber(fabric_entry)
    local weight = roll_string("2d") * 3
    local cost = weight * fabric_entry.cost
    local item = {
        name = fabric_entry.name,
        cost = cost,
        weight = weight
    }
    return item
end

fabrics_table = expand_table{
    ["1, 1"]   = {name="Otherworldly Cloth", cost=200, weight=7.5},
    ["1, 2"]   = {name="Giant-Spider Silk Cloth", cost=565, weight=1},
    ["1, 3-4"] = {name="Gauze Cloth", cost=5, weight=1.5},
    ["1, 5-6"] = {name="Linen Cloth", cost=14, weight=2.5},
    ["2, 1-2"] = {name="Pashmina Wool Cloth", cost=45, weight=4},
    ["2, 3-4"] = {name="Plain Silk Cloth", cost=17, weight=2},
    ["2, 5-6"] = {name="Samite Cloth", cost=42.50, weight=3},
    ["3, 1-2"] = {name="Satin Cloth", cost=75, weight=2},
    ["3, 3-4"] = {name="Velvet Cloth", cost=18, weight=5},
    ["3, 5"]   = {name="Wool Cloth", cost=15, weight=6},
    ["3, 6"]   = {name="Common Fur", cost=200, weight=75, cb=get_common_fur},
    ["4, 1-2"] = {name="Exotic Fur", cost=500, weight=75, cb=get_exotic_fur},
    ["4, 3-4"] = {name="Common Leather", cost=150, weight=50, cb=get_common_leather},
    ["4, 5-6"] = {name="Exotic Leather", cost=250 ,weight=50, cb=get_exotic_leather},
    ["5, 1-2"] = {name="Scale-Hide", cost=275, weight=50},
    ["5, 3-4"] = {name="Contraband Leather", cost=500, weight=25, cb=get_contraband_leather},
    ["5, 5"]   = {name="Otherworldly Leather", cost=1000, weight=50},
    ["5, 6"]   = {name="Linen Fiber", cost=0.25, cb=get_fiber},
    ["6, 1"]   = {name="Silk Fiber", cost=0.75, cb=get_fiber},
    ["6, 2"]   = {name="Wild Silk Fiber", cost=0.65, cb=get_fiber},
    ["6, 3"]   = {name="Wool Fiber", cost=0.20, cb=get_fiber},
    ["6, 4"]   = {name="Pashmina Wool Fiber", cost=0.60, cb=get_fiber},
    ["6, 5"]   = {name="Giant-Spider Silk Fiber", cost=10, cb=get_fiber},
    ["6, 6"]   = {name="Otherworldly Fiber", cost=7, cb=get_fiber}
}

function get_fabric(treasure_entry)
    local roll_result = roll_string("1d, 1d")
    local fabric_entry = fabrics_table[roll_result]
    if fabric_entry.cb then
        return deduplicate_item(fabric_entry:cb())
    else
        local fabric = deduplicate_item{
            name = fabric_entry.name,
            cost = fabric_entry.cost * treasure_entry.qty,
            weight = fabric_entry.weight * treasure_entry.qty
        }
        return {fabric}
    end
end
