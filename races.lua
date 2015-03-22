elves_table = {
    ["1"] = "Half-Elf",
    ["2"] = "High Elf",
    ["3"] = "Mountain Elf",
    ["4"] = "Sea Elf",
    ["5"] = "Shadow Elf",
    ["6"] = "Winged Elf",
    ["7"] = "Wood Elf"
}

function get_elf()
    return elves_table[roll_string("1-7")]
end

faerie_folk_table = {
    ["1"] = "Faun",
    ["2"] = "Leprechaun",
    ["3"] = "Nymph",
    ["4"] = "Pixie"
}

function get_faerie()
    return faerie_folk_table[roll_string("1-4")]
end

goblin_kin_table = {
    ["1"] = "Goblin",
    ["2"] = "Half-Orc",
    ["3"] = "Hobgoblin",
    ["4"] = "Orc"
}

function get_goblin_kin()
    return goblin_kin_table[roll_string("1-4")]
end

half_spirits_table = {
    ["1"] = "Celestial",
    ["2"] = "Elder-Spawn",
    ["3"] = "Infernal",
    ["4"] = "Air-Infused",
    ["5"] = "Earth-Infused",
    ["6"] = "Fire-Infused",
    ["7"] = "Water-Infused"
}

function get_half_spirit()
    return half_spirits_table[roll_string("1-7")]
end

infused_table = {
    ["1"] = "Air-Infused",
    ["2"] = "Earth-Infused",
    ["3"] = "Fire-Infused",
    ["4"] = "Water-Infused"
}

function get_infused()
    return infused_table[roll_string("1-4")]
end

reptilian_table = {
    ["1"] = "Dragon-Blooded",
    ["2"] = "Lizard Man"
}

function get_reptilian()
    return reptilian_table[roll_string("1-2")]
end

races_table = expand_table{
    ["1-2, 1-2, 1"]   = {name="Cat-Folk"},
    ["1-2, 1-2, 2"]   = {name="Coleopteran"},
    ["1-2, 1-2, 3"]   = {name="Corpse-Eater"},
    ["1-2, 1-2, 4"]   = {name="Dark One"},
    ["1-2, 1-2, 5-6"] = {name="Dwarf"},
    ["1-2, 3-4, 1-2"] = {name="All Elves", cb=get_elf},
    ["1-2, 3-4, 3"]   = {name="Half-Elf"},
    ["1-2, 3-4, 4"]   = {name="High Elf"},
    ["1-2, 3-4, 5"]   = {name="Mountain Elf"},
    ["1-2, 3-4, 6"]   = {name="Sea Elf"},
    ["1-2, 5-6, 1"]   = {name="Shadow Elf"},
    ["1-2, 5-6, 2"]   = {name="Winged Elf"},
    ["1-2, 5-6, 3"]   = {name="Wood Elf"},
    ["1-2, 5-6, 4-5"] = {name="All Faerie Folk", cb=get_faerie},
    ["1-2, 5-6, 6"]   = {name="Faun"},
    ["3-4, 1-2, 1"]   = {name="Leprechaun"},
    ["3-4, 1-2, 2"]   = {name="Nymph"},
    ["3-4, 1-2, 3"]   = {name="Pixie"},
    ["3-4, 1-2, 4"]   = {name="Gargoyle"},
    ["3-4, 1-2, 5-6"] = {name="Gnome"},
    ["3-4, 3-4, 1-3"] = {name="All Goblin-Kin", cb=get_goblin_kin},
    ["3-4, 3-4, 4"]   = {name="Goblin"},
    ["3-4, 3-4, 5"]   = {name="Half-Orc"},
    ["3-4, 3-4, 6"]   = {name="Hobgoblin"},
    ["3-4, 5-6, 1"]   = {name="Orc"},
    ["3-4, 5-6, 2"]   = {name="Halfling"},
    ["3-4, 5-6, 3-4"] = {name="All Half-Spirits", cb=get_half_spirit},
    ["3-4, 5-6, 5"]   = {name="Celestial"},
    ["3-4, 5-6, 6"]   = {name="Elder-Spawn"},
    ["5-6, 1-2, 1"]   = {name="Infernal"},
    ["5-6, 1-2, 2-5"] = {name="Human"},
    ["5-6, 1-2, 6"]   = {name="All Infused", cb=get_infused},
    ["5-6, 3-4, 1"]   = {name="Air-Infused"},
    ["5-6, 3-4, 2"]   = {name="Earth-Infused"},
    ["5-6, 3-4, 3"]   = {name="Fire-Infused"},
    ["5-6, 3-4, 4"]   = {name="Water-Infused"},
    ["5-6, 3-4, 5"]   = {name="Minotaur"},
    ["5-6, 3-4, 6"]   = {name="Half-Ogre"},
    ["5-6, 5-6, 1"]   = {name="Ogre"},
    ["5-6, 5-6, 2"]   = {name="All Reptilians", cb=get_reptilian},
    ["5-6, 5-6, 3"]   = {name="Dragon-Blooded"},
    ["5-6, 5-6, 4"]   = {name="Lizard Man"},
    ["5-6, 5-6, 5"]   = {name="Troll"},
    ["5-6, 5-6, 6"]   = {name="Woldman"}
}

function get_race()
    local races_entry = races_table[roll_string("1d, 1d, 1d")]
    if races_entry.cb then
        return races_entry.cb()
    else
        return races_entry.name
    end
end
