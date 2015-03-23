require "containers"

other_materials_table = expand_table{
    ["1, 1"] = {name="Ale", value=5, vol="gallon"},
    ["1, 2"] = {name="Dstilled Liquor", value=16, vol="pint"},
    ["1, 3"] = {name="Flavoured Ale", value=7.5, vol="gallon"},
    ["1, 4"] = {name="Flavoured Brandy", value=20, vol="pint"},
    ["1, 5"] = {name="Kumiz", value=15, vol="gallon"},
    ["1, 6"] = {name="Mead", value=11, vol="gallon"},
    ["2, 1"] = {name="Opium", value=20, vol="oz"},
    ["2, 2"] = {name="Black Tea", value=2.25, vol="oz"},
    ["2, 3"] = {name="Green Tea", value=2.25, vol="oz"},
    ["2, 4"] = {name="Date Wine", value=9, vol="gallon"},
    ["2, 5"] = {name="Grape Wine", value=9, vol="gallon"},
    ["2, 6"] = {name="Rice Wine", value=8, vol="gallon"},
    ["3, 1"] = {name="Otherworldly Wine", value=20, vol="gallon"},
    ["3, 2"] = {name="Sealing Wax", value=1.25, vol="oz"},
    ["3, 3"] = {name="Ambergris", value=35, vol="oz"},
    ["3, 4"] = {name="Cedar Resin", value=10, vol="oz"},
    ["3, 5"] = {name="Copal", value=11, vol="oz"},
    ["3, 6"] = {name="Frankincense", value=16, vol="oz"},
    ["4, 1"] = {name="Musk", value=28, vol="oz"},
    ["4, 2"] = {name="Myrrh", value=15, vol="oz"},
    ["4, 3"] = {name="Onycha", value=20, vol="oz"},
    ["4, 4"] = {name="Patchouli", value=9, vol="oz"},
    ["4, 5"] = {name="Sandalwood Gum", value=8.5, vol="oz"},
    ["4, 6"] = {name="Flower Water", value=5, vol="oz"},
    ["5, 1"] = {name="Perfumed Essence", value=12, vol="oz"},
    ["5, 2"] = {name="Perfumed Oil", value=8, vol="oz"},
    ["5, 3"] = {name="Pomander", value=9, vol="oz"},
    ["5, 4"] = {name="Carmine", value=40, vol="oz"},
    ["5, 5"] = {name="Cinnabar", value=18, vol="oz"},
    ["5, 6"] = {name="Ochre", value=0.75, vol="oz"},
    ["6, 1"] = {name="Henna", value=1, vol="oz"},
    ["6, 2"] = {name="Indigo", value=32, vol="oz"},
    ["6, 3"] = {name="Madder", value=2, vol="oz"},
    ["6, 4"] = {name="Murex", value=29, vol="oz"},
    ["6, 5"] = {name="Orpiment", value=22, vol="oz"},
    ["6, 6"] = {name="Woad", value=2.75, vol="oz"}
}

function get_loose_other_material(treasure_entry)
    local entry = other_materials_table[roll_string("1d, 1d")]
    local qty = roll_string("1d + 1") * treasure_entry.qty
    -- Assuming water
    local weight
    if entry.vol == "pint" then
        weight = qty
    else if entry.vol == "gallon" then
        weight = qty * 8
    else if entry.vol == "oz" then
        weight = qty / 20
    else
        print("Unhandled volume type " .. entry.vol)
    end
    local item = {
        name = entry.name,
        cost = qty * entry.value,
        weight = weight,
        qty = qty,
        vol = entry.vol
    }
    return item
end

function get_other_material(treasure_entry)
    -- TODO: Make this sensible, handle adding contents to containers
    --       gracefully and consistently
    local material = get_loose_other_material(treasure_entry)
    local total_vol_oz
    if material.vol == "oz" then
        total_vol_oz = material.qty
    else if material.vol == "pint" then
        total_vol_oz = material.qty * 20
    else if material.vol == "gallon" then
        total_vol_oz = material.qty * 20 * 8
    else
        print("Unhandled volume type " .. material.vol)
    end
    local item
    local container
    local multi_items = 0
    local multi_container
    local qty_per_container
    -- Find appropriate containers
    if total_vol_oz <= 10 then
        -- vial
        container = container_vial
        item = {
            name = container_vial.name,
            cost = container_vial.cost,
            weight = container_vial.weight,
            soft = container_vial.soft,
            contents = {
                material
            }
        }
    else if total_vol_oz <= 20 then
        -- small bottle
        container = container_bottle_small
    else if total_vol_oz <= 40 then
        -- bottle
        container = container_bottle
    else if total_vol_oz <= 20 * 8 then
        -- less than a gallon, box of bottles
        container = container_bottle
        qty_per_container = 40
        multi_items = total_vol_oz / qty_per_container
        multi_container = container_box
    else if total_vol_oz <= 5 * 20 * 8 then
        container = container_barrel
        -- one barrel
    else
        container = container_barrel
        qty_per_container = 5 * 20 * 8
        multi_items = total_vol_oz / qty_per_container
        -- many barrels
    end
    if not multi_items then
        item = {
            name = container.name,
            cost = container.cost,
            weight = container.weight,
            soft = container.soft,
            contents = {
                material
            }
        }
    else
        item = {
            name = multi_container.name,
            cost = multi_container.cost,
            weight = multi_container.weight,
            soft = multi_container.soft,
            contents = {}
        }
        while multi_items >= 1 do
            table.insert(item.contents, {
                name = container.name,
                cost = container.cost,
                weight = container.weight,
                soft = container.soft,
                contents = {{
                    name = material.name,
                }}
            })
        end
    end
    return item
end

function get_contained_spice(treasure_entry)
    local roll_result = roll_string("1d, 1d")
    local spice_weight = roll_string("1d3") * treasure_entry.qty
    local spice_entry = spices_table[roll_result]
    local spice = get_spice(treasure_entry)
    local item = {
        name = container_vial.name,
        cost = container_vial.cost,
        weight = container_vial.weight, -- lbs
        soft = container_vial.soft,
        contents = {
            spice
        }
    }
    return item
end

function get_spice(treasure_entry)
    local roll_result = roll_string("1d, 1d")
    local spice_weight = roll_string("1d3") * treasure_entry.qty
    local spice_entry = spices_table[roll_result]
    local spice = {
        name = spice_entry.name,
        cost = spice_entry.value * spice_weight,
        weight = spice_weight / 16 -- oz.
    }
    return spice
end
