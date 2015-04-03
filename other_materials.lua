require "containers"
local inspect = require "lib/inspect"
-- 1lb is 16 oz    - 1/16
-- 1 pint is 20 oz - 20/16
-- 1 gallon is 8 pints - 10

other_materials_table = expand_table{
    ["1, 1"] = {name="Ale", value=5, weight=10},
    ["1, 2"] = {name="Dstilled Liquor", value=16, weight=20/16},
    ["1, 3"] = {name="Flavoured Ale", value=7.5, weight=10},
    ["1, 4"] = {name="Flavoured Brandy", value=20, weight=20/16},
    ["1, 5"] = {name="Kumiz", value=15, weight=10},
    ["1, 6"] = {name="Mead", value=11, weight=10},
    ["2, 1"] = {name="Opium", value=20, weight=1/16},
    ["2, 2"] = {name="Black Tea", value=2.25, weight=1/16},
    ["2, 3"] = {name="Green Tea", value=2.25, weight=1/16},
    ["2, 4"] = {name="Date Wine", value=9, weight=10},
    ["2, 5"] = {name="Grape Wine", value=9, weight=10},
    ["2, 6"] = {name="Rice Wine", value=8, weight=10},
    ["3, 1"] = {name="Otherworldly Wine", value=20, weight=10},
    ["3, 2"] = {name="Sealing Wax", value=1.25, weight=1/16},
    ["3, 3"] = {name="Ambergris", value=35, weight=1/16},
    ["3, 4"] = {name="Cedar Resin", value=10, weight=1/16},
    ["3, 5"] = {name="Copal", value=11, weight=1/16},
    ["3, 6"] = {name="Frankincense", value=16, weight=1/16},
    ["4, 1"] = {name="Musk", value=28, weight=1/16},
    ["4, 2"] = {name="Myrrh", value=15, weight=1/16},
    ["4, 3"] = {name="Onycha", value=20, weight=1/16},
    ["4, 4"] = {name="Patchouli", value=9, weight=1/16},
    ["4, 5"] = {name="Sandalwood Gum", value=8.5, weight=1/16},
    ["4, 6"] = {name="Flower Water", value=5, weight=1/16},
    ["5, 1"] = {name="Perfumed Essence", value=12, weight=1/16},
    ["5, 2"] = {name="Perfumed Oil", value=8, weight=1/16},
    ["5, 3"] = {name="Pomander", value=9, weight=1/16},
    ["5, 4"] = {name="Carmine", value=40, weight=1/16},
    ["5, 5"] = {name="Cinnabar", value=18, weight=1/16},
    ["5, 6"] = {name="Ochre", value=0.75, weight=1/16},
    ["6, 1"] = {name="Henna", value=1, weight=1/16},
    ["6, 2"] = {name="Indigo", value=32, weight=1/16},
    ["6, 3"] = {name="Madder", value=2, weight=1/16},
    ["6, 4"] = {name="Murex", value=29, weight=1/16},
    ["6, 5"] = {name="Orpiment", value=22, weight=1/16},
    ["6, 6"] = {name="Woad", value=2.75, weight=1/16}
}

function get_other_material(treasure_entry)
    local loose_item = get_loose_other_material(treasure_entry)
    local container
    local items
    container = get_smallest_suitable_container(loose_item.weight, true)
    if container ~= nil then
        items = {deduplicate_item{
            name = container.name,
            cost = container.cost,
            weight = container.weight,
            soft = container.soft,
            contents = {
                loose_item
            }
        }}
    else
        container = get_best_container(true)
        local container_count = loose_item.weight / container.capacity
        items = {}
        while container_count > 0 do
            local contents_weight = math.min(1, container_count) * container.capacity
            table.insert(items, {
                name = container.name,
                cost = container.cost,
                weight = container.weight,
                soft = container.soft,
                contents = {deduplicate_item{
                    name = loose_item.name,
                    cost = loose_item.value * contents_weight,
                    weight = contents_weight
                }}
            })
            container_count = container_count - 1
        end
    end
    return items
end

function get_loose_other_material(treasure_entry)
    local entry = other_materials_table[roll_string("1d, 1d")]
    local weight = roll_string("1d + 1") * treasure_entry.qty * entry.weight
    local item = {
        name = entry.name,
        cost = weight * entry.value,
        weight = weight,
        value = entry.value
    }
    return item
end
