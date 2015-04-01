require "containers"
require "decoration"

local note_1 = "Scattered in your path, this will make any tracker start sneezing (B.428). Tracker rolls HT-3 or stops tracking for an hour"
local note_2 = "Aphrodisiac. Consuming an ounce imposes -1 on rolls to resist lecherousness or seduction for 1 hour"
local note_3 = "+1 to HT. to resist poison for 1 hour"
local note_4 = "Strengthens blood. For 1 day, gives +1 to HT. rolls to recover lost HP"
local note_5 = "Legal high. For 1 hour, gives -1 to resist mind-reading or mind-control"
local note_6 = "For 1 hour, resists nausea at +2"
local note_7 = "Stabilizes mood. For 1 hour, +1 to resist berserk and bloodlust"
local note_8 = "Mild stimulant. For 1 hour, +1 to HT. to resist unconsciousness or FP loss"
local note_9 = "Toss an ounce to give +1 to Turn Zombie and True Faith to turn Zombies"
local note_10 = "Antiseptic. Use an ounce to give +1 to first aid"

spices_table = {
    ["1, 1"] = {name="Allspice", value=150},
    ["1, 2"] = {name="Anise", value=150},
    ["1, 3"] = {name="Annatto", value=113},
    ["1, 4"] = {name="Asafetida", value=75},
    ["1, 5"] = {name="Cardamom", value=150},
    ["1, 6"] = {name="Cassia", value=75},
    ["2, 1"] = {name="Chiles", value=38, notes=note_1},
    ["2, 2"] = {name="Cinnamon", value=150, notes=note_2},
    ["2, 3"] = {name="Clove", value=150},
    ["2, 4"] = {name="Coriander", value=150, notes=note_3},
    ["2, 5"] = {name="Cumin", value=150},
    ["2, 6"] = {name="Dwarven Savory Fungus", value=75, notes=note_4},
    ["3, 1"] = {name="Elven Pepperbark", value=38},
    ["3, 2"] = {name="Faerie Glimmerseed", value=270, notes=note_5},
    ["3, 3"] = {name="Fennel", value=75},
    ["3, 4"] = {name="Fenugreek", value=150},
    ["3, 5"] = {name="Ginger", value=38, notes=note_6},
    ["3, 6"] = {name="Halfling Savory", value=150, notes=note_4},
    ["4, 1"] = {name="Huajiao (Szechuan Pepper)", value=150, notes=note_1},
    ["4, 2"] = {name="Mace", value=225},
    ["4, 3"] = {name="Mustard", value=38},
    ["4, 4"] = {name="Nigella", value=75, notes=note_7},
    ["4, 5"] = {name="Nutmeg", value=150},
    ["4, 6"] = {name="Onion Seed", value=38},
    ["5, 1"] = {name="Orcish Firegrain", value=150, notes=note_8},
    ["5, 2"] = {name="Pepper, Black", value=150, notes=note_1},
    ["5, 3"] = {name="Pepper, White", value=188, notes=note_1},
    ["5, 4"] = {name="Poppy Seed", value=38},
    ["5, 5"] = {name="Saffron", value=300},
    ["5, 6"] = {name="Salt", value=15, notes=note_9},
    ["6, 1"] = {name="Salt, Black", value=38, notes=note_9},
    ["6, 2"] = {name="Salt, Red", value=38, notes=note_9},
    ["6, 3"] = {name="Surmac", value=38},
    ["6, 4"] = {name="Tamarind", value=15},
    ["6, 5"] = {name="Turmeric", value=38, notes=note_10},
    ["6, 6"] = {name="zeodary", value=150}
}

expand_table(spices_table)

function get_contained_spice(treasure_entry)
    local roll_result = roll_string("1d, 1d")
    local spice_entry = spices_table[roll_result]
    local spice = get_spice(treasure_entry)
    local container = get_smallest_suitable_container(spice.weight * 16, true)
    local item = {
        name = container.name,
        cost = container.cost,
        weight = container.weight, -- lbs
        soft = container.soft,
        contents = {
            spice
        }
    }
    return item
end

function get_spice(treasure_entry)
    local roll_result = roll_string("1d, 1d")
    local spice_oz = roll_string("1d3") * treasure_entry.qty
    local spice_entry = spices_table[roll_result]
    local spice = {
        name = spice_entry.name,
        cost = spice_entry.value * spice_oz,
        weight = spice_oz / 16 -- store in lbs
    }
    return spice
end
