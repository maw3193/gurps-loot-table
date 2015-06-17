function get_enchantment_entry(t_ent)
    local entry = t_ent.t[roll_string(t_ent.roll)]
    if entry.cb then
        return entry:cb()
    else
        return entry
    end
end

enchantment_power_table = expand_table{
    ["1-2"] = {name="Power 1", cost=10000},
    ["3-4"] = {name="Power 2", cost=20000},
    ["5"]   = {name="Power 3", cost=40000},
    ["6"]   = {name="Power 4", cost=80000}
}

enchantment_reserve_table = expand_table{
    ["1-3, 1"] = "Blood",
    ["1-3, 2"] = "Fire",
    ["1-3, 3"] = "Gold",
    ["1-3, 4"] = "High Sanctity",
    ["1-3, 5"] = "High Mana",
    ["1-3, 6"] = "Moonlight",
    ["4-6, 1"] = "Music",
    ["4-6, 2"] = "Rain",
    ["4-6, 3"] = "Seawater",
    ["4-6, 4"] = "Silver",
    ["4-6, 5"] = "Sunlight",
    ["4-6, 6"] = "Tears"
}

local function name_is_meta(name)
    if string.match(name, "^Power") or
        name == "Dedicated Reserve" or
        name == "Regenerating Reserve" or
        name == "Rechargeable Reserve" then
        return true
    else
        return false
    end
end

local function get_non_meta_enchantment(ench_table, roll)
    local spell = get_enchantment_entry{t=ench_table, roll=roll}
    while name_is_meta(spell.name) do
        spell = get_enchantment_entry{t=ench_table, roll=roll}
    end
end

function enchantment_add_power(ench_table, roll)
    local power = get_enchantment_entry{t=enchantment_power_table, roll="1d"}
    local spell = get_non_meta_enchantment(ench_table, roll)
    return {power, spell}
end


function enchantment_attack_add_power()
    return enchantment_add_power(enchantment_attack_table, "1d, 1d, 1d")
end

function enchantment_add_reserve(table_entry, ench_table, roll)
    local spell = get_non_meta_enchantment(ench_table, roll)
    local reserve_name = table_entry.name.." "..spell.reserve
    local reserve_cost = table_entry.cost * spell.reserve
    local reserve = {name=reserve_name, cost=reserve_cost}
    -- dedicated reserve, like a power item
    -- regenerating reserve, like a powerstone
    -- rechargeable reserve, from a reserve.
end

function enchantment_attack_add_reserve(reserve)
    return enchantment_add_reserve(reserve, enchantment_attack_table, "1d, 1d, 1d")
end

enchantment_attack_table = expand_table{
    ["1-3, 1, 1"]   = {name="Acid Ball",             cost=6000, reserve=6},
    ["1-3, 1, 2"]   = {name="Acid Jet",              cost=8000, reserve=6},
    ["1-3, 1, 3"]   = {name="Air Jet",               cost=4000, reserve=6},
    ["1-3, 1, 4"]   = {name="Arboreal Immurement",   cost=20000, reserve=48},
    ["1-3, 1, 5"]   = {name="Ball of Lightning",     cost=12000, reserve=12},
    ["1-3, 1, 6"]   = {name="Breathe Fire",          cost=20000, reserve=6},
    ["1-3, 2, 1"]   = {name="Breathe Steam",         cost=20000, reserve=6},
    ["1-3, 2, 2"]   = {name="Burning Death",         cost=14000, reserve=18},
    ["1-3, 2, 3"]   = {name="Burning Touch",         cost=6000, reserve=6},
    ["1-3, 2, 4"]   = {name="Clumsiness",            cost=16000, reserve=6},
    ["1-3, 2, 5"]   = {name="Concussion",            cost=20000, reserve=12},
    ["1-3, 2, 6"]   = {name="Debility",              cost=18000, reserve=6},
    ["1-3, 3, 1"]   = {name="Dehydrate",             cost=14000, reserve=6},
    ["1-3, 3, 2-3"] = {name="Explosive Fireball",    cost=24000, reserve=12},
    ["1-3, 3, 4-5"] = {name="Explosive Lightning",   cost=24000, reserve=12},
    ["1-3, 3, 6"]   = {name="Fire Cloud",            cost=3500, reserve=6},
    ["1-3, 4, 1-2"] = {name="Fireball",              cost=16000, reserve=6},
    ["1-3, 4, 3-4"] = {name="Flame Jet",             cost=16000, reserve=6},
    ["1-3, 4, 5-6"] = {name="Flash",                 cost=4000, reserve=24},
    ["1-3, 5, 1"]   = {name="Flesh to Ice",          cost=24000, reserve=72},
    ["1-3, 5, 2"]   = {name="Frailty",               cost=20000, reserve=12},
    ["1-3, 5, 3"]   = {name="Frostbite",             cost=14000, reserve=6},
    ["1-3, 5, 4"]   = {name="Hinder",                cost=12000, reserve=6},
    ["1-3, 5, 5-6"] = {name="Ice Dagger",            cost=8000, reserve=6},
    ["1-3, 6, 1"]   = {name="Ice Sphere",            cost=8000, reserve=6},
    ["1-3, 6, 2"]   = {name="Icy Breath",            cost=8000, reserve=6},
    ["1-3, 6, 3"]   = {name="Icy Missiles",          cost=20000, reserve=24},
    ["1-3, 6, 4"]   = {name="Icy Touch",             cost=16000, reserve=12},
    ["1-3, 6, 5-6"] = {name="Lightning",             cost=16000, reserve=6},
    ["4-6, 1, 1"]   = {name="Lightning Stare",       cost=20000, reserve=6},
    ["4-6, 1, 2"]   = {name="Lightning Whip",        cost=7000, reserve=6},
    ["4-6, 1, 3"]   = {name="Mud Jet",               cost=12000, reserve=6},
    ["4-6, 1, 4-5"] = {name="Pain",                  cost=8000, reserve=12},
    ["4-6, 1, 6"]   = {name="Pestilence",            cost=20000, reserve=36},
    ["4-6, 2, 1"]   = {name="Rain of Acid",          cost=24000, reserve=18},
    ["4-6, 2, 2"]   = {name="Rain of Fire",          cost=12000, reserve=6},
    ["4-6, 2, 3"]   = {name="Rain of Ice Daggers",   cost=16000, reserve=12},
    ["4-6, 2, 4"]   = {name="Rain of Nuts",          cost=10000, reserve=3},
    ["4-6, 2, 5"]   = {name="Rain of Stones",        cost=10000, reserve=6},
    ["4-6, 2, 6"]   = {name="Rooted Feet",           cost=8000, reserve=18},
    ["4-6, 3, 1"]   = {name="Rotting Death",         cost=14000, reserve=18},
    ["4-6, 3, 2"]   = {name="Sand Jet",              cost=12000, reserve=6},
    ["4-6, 3, 3-4"] = {name="Shocking Touch",        cost=30000, reserve=6},
    ["4-6, 3, 5"]   = {name="Sickness (cast)",       cost=30000, reserve=18},
    ["4-6, 3, 6"]   = {name="Snow Jet",              cost=12000, reserve=6},
    ["4-6, 4, 1"]   = {name="Sound Jet",             cost=8000, reserve=6},
    ["4-6, 4, 2"]   = {name="Spider Silk",           cost=8000, reserve=6},
    ["4-6, 4, 3"]   = {name="Spit Acid",             cost=8000, reserve=6},
    ["4-6, 4, 4"]   = {name="Steal Energy",          cost=16000, reserve=3},
    ["4-6, 4, 5"]   = {name="Steal Vitality (cast)", cost=30000, reserve=3},
    ["4-6, 4, 6"]   = {name="Steam Jet",             cost=14000, reserve=6},
    ["4-6, 5, 1"]   = {name="Steelwraith",           cost=5000, reserve=42},
    ["4-6, 5, 2"]   = {name="Stone Missile",         cost=8000, reserve=6},
    ["4-6, 5, 3"]   = {name="Stun",                  cost=10000, reserve=12},
    ["4-6, 5, 4"]   = {name="Sunbolt",               cost=16000, reserve=6},
    ["4-6, 5, 5-6"] = {name="Power",                 cost=0, reserve=0, cb=enchantment_attack_add_power},
    ["4-6, 6, 1-2"] = {name="Dedicated Reserve",     cost=40, reserve=0}, -- TODO SPECIAL CASE
    ["4-6, 6, 3-4"] = {name="Regenerating Reserve",  cost=80, reserve=0}, -- TODO SPECIAL CASE
    ["4-6, 6, 5-6"] = {name="Rechargeable Reserve",  cost=100, reserve=0} -- TODO SPECIAL CASE
}

enchantment_buff_table = expand_table{
    ["1-6, 1-6, 1-6"] = {name="Generic Buff Enchantment", cost=0, reserve=0}
}

enchantment_defense_table = expand_table{
    ["1-6, 1-6, 1-6"] = {name="Generic Defense Enchantment", cost=0, reserve=0}
}

enchantment_environmental_table = expand_table{
    ["1-6, 1-6, 1-6"] = {name="Generic Environmental Enchantment", cost=0, reserve=0}
}

enchantment_influence_table = expand_table{
    ["1-6, 1-6"] = {name="Generic Influence Enchantment", cost=0, reserve=0}
}

enchantment_type_table = expand_table{
    ["1"]   = {t=enchantment_attack_table, roll="1d, 1d, 1d", cb=get_enchantment_entry},
    ["2"]   = {t=enchantment_buff_table, roll="1d, 1d, 1d", cb=get_enchantment_entry},
    ["3"]   = {t=enchantment_defense_table, roll="1d, 1d, 1d", cb=get_enchantment_entry},
    ["4-5"] = {t=enchantment_environmental_table, roll="1d, 1d, 1d", cb=get_enchantment_entry},
    ["6"]   = {t=enchantment_influence_table, roll="1d, 1d", cb=get_enchantment_entry}
}

enchantment_weapon_table = expand_table{
    ["1-6, 1-6"] = {name="Generic Weapon Enchantment", melee_cost=0, missile_cost=0, projectile_cost=0}
}

enchantment_armor_table = expand_table{
    ["1-6, 1-6"] = {name="Generic Armor Enchantment", cost=0}
}

enchantment_shield_table = expand_table{
    ["1-6, 1-6"] = {name="Generic Shield Enchantment", cost=0}
}

local type_to_table = {
    ["Basic Set Melee"] = {t=enchantment_weapon_table, roll="1d, 1d"},
    ["Mart. Arts Melee"] = {t=enchantment_weapon_table, roll="1d, 1d"},
    ["Basic Set Missile"] = {t=enchantment_weapon_table, roll="1d, 1d"},
    ["Mart. Arts Missile"] = {t=enchantment_weapon_table, roll="1d, 1d"},
    ["Armor"] = {t=enchantment_armor_table, roll="1d, 1d"},
    ["Shields"] = {t=enchantment_shield_table, roll="1d, 1d"}
}

local function get_item_table_from_item(item)
    -- May be generic entry or a specific item (that has a type)
    return type_to_table[item.type] or type_to_table[item.name] or {t=enchantment_type_table, roll="1d"}
end

function get_enchantments(item, count)
    local enchants = {}
    local curses = {}
    for i=1, count do
        local ench, curse
        ench, curse = get_enchantment(item)
        for _,e in ipairs(ench) do
            table.insert(enchants, e)
        end
        for _,c in ipairs(curse) do
            table.insert(curses, c)
        end
    end
    return enchants, curses
end

function get_enchantment(item)
    -- Returns a table of enchantments and a list of curses.
    -- TODO CURSES!
    local enchantments = get_enchantment_entry(get_item_table_from_item(item))
    local curses = {}
    -- it may return an enchantment, or a list of enchantments
    if #enchantments == 0 then enchantments = {enchantments} end
    return enchantments, curses
end
