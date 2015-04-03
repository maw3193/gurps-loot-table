require "helpers"
gems_table = expand_table {
    ["1, 1-2"] = {name="Bigger"},
    ["1, 3"]   = {name="Agate", value=5},
    ["1, 4"]   = {name="Azurite", value=10},
    ["1, 5"]   = {name="Chalcedony", value=10},
    ["1, 6"]   = {name="Hematite", value=5},
    ["2, 1"]   = {name="Jade", value=20},
    ["2, 2"]   = {name="Jet", value=10},
    ["2, 3"]   = {name="Magnetite", value=5},
    ["2, 4"]   = {name="Malachite", value=15},
    ["2, 5"]   = {name="Obsidian", value=2},
    ["2, 6"]   = {name="Quartz", value=15},
    ["3, 1"]   = {name="Amber", value=25},
    ["3, 2"]   = {name="Amethyst", value=30},
    ["3, 3"]   = {name="Calcite", value=20},
    ["3, 4"]   = {name="Sard", value=25},
    ["3, 5"]   = {name="Coral", value=20},
    ["3, 6"]   = {name="Lapis Lazuli", value=25},
    ["4, 1"]   = {name="Onyx", value=20},
    ["4, 2"]   = {name="Tourmaline", value=25},
    ["4, 3"]   = {name="Turquoise", value=20},
    ["4, 4"]   = {name="Aquamarine", value=30},
    ["4, 5"]   = {name="Beryl", value=30},
    ["4, 6"]   = {name="Bloodstone", value=30},
    ["5, 1"]   = {name="Cat's eye", value=30},
    ["5, 2"]   = {name="Emerald", value=35},
    ["5, 3"]   = {name="Garnet", value=35},
    ["5, 4"]   = {name="Iolite", value=30},
    ["5, 5"]   = {name="Moonstone", value=30},
    ["5, 6"]   = {name="Opal", value=35},
    ["6, 1"]   = {name="Pearl", value=35},
    ["6, 2"]   = {name="Peridot", value=30},
    ["6, 3"]   = {name="Ruby", value=35},
    ["6, 4"]   = {name="Sapphire", value=35},
    ["6, 5"]   = {name="Topaz", value=35},
    ["6, 6"]   = {name="Diamond", value=40}
}

function get_gem()
    -- Barring hugely-improbable rolls, the weight of gems is insignificant
    local carat = roll_string("2d") / 4
    local roll_result = roll_string("1d, 1d")
    while gems_table[roll_result].name == "Bigger" do
        carat = carat + roll_string("1d")
        roll_result = roll_string("1d, 1d")
    end
    local gem_entry = gems_table[roll_result]
    local gem_value = (carat * carat + 4 * carat) * gem_entry.value
    local gem_name = string.format("%2.2f Carat %s", carat, gem_entry.name)
    return deduplicate_item{name=gem_name, cost=gem_value, weight=0}
end
