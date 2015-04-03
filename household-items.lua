require "decoration"

function get_place_setting(entry)
    local settings = roll_string("1d")
    local item = {
        name = entry.name,
        cost = entry.cost,
        weight = entry.weight
    }
    local items = {}
    for i=1,settings do
        table.insert(items, item)
    end
    return items
end

function get_painting(entry)
    local motif = motif_table[roll_string("1d, 1d, 1d")]
    local width = roll_string("1d") / 2
    local height = roll_string("1d") / 2
    return {{
        name = entry.name,
        cost = entry.cost * width * height,
        weight = entry.weight * width * height,
        motif = motif
    }}
end

function get_pennant(entry)
    local motif = motif_table[roll_string("1d, 1d, 1d")]
    return {{
        name = entry.name,
        cost = entry.cost,
        weight = entry.weight,
        motif = motif
    }}
end

function get_sculpture(entry)
    local motif = motif_table[roll_string("1d, 1d, 1d")]
    local volume = roll_string("2d") / roll_string("1d")
    return {{
        name = entry.name,
        cost = entry.cost * volume,
        weight = entry.weight * volume
    }}
end

function get_carpet(entry)
    local area = roll_string("2d+2")
    return {{
        name = entry.name,
        cost = entry.cost * area,
        weight = entry.weight * area,
        area = area
    }}
end

function get_tapestry(entry)
    local motif = motif_table[roll_string("1d, 1d, 1d")]
    local area = roll_string("3d+10")
    return {{
        name = entry.name,
        cost = entry.cost * area,
        weight = entry.weight * area,
        area = area,
        motif = motif
    }}
end

function get_cosmetics(entry)
    local qty = roll_string("1d") / 2
    return {{
        name = entry.name,
        cost = entry.cost * qty,
        weight = entry.weight * qty
    }}
end

function get_mechanical_toy(entry)
    local other_toy
    if math.random(0, 1) then
        other_toy = household_items_table[roll_string("5-6, 5, 2-6")]
    else
        other_toy = household_items_table[roll_string("5-6, 6, 1-5")]
    end
    return {{
        name = "Mechanical "..other_toy.name,
        cost = other_toy.cost,
        weight = other_toy.weight,
        cf = 8
    }}
end

household_items_table = expand_table {
    -- Cooking
    ["1-2, 1, 1"]   = {name="Basin", cost=3, weight=4, soft=false},
    ["1-2, 1, 2"]   = {name="Bowl", cost=1, weight=0.3, soft=false},
    ["1-2, 1, 3"]   = {name="Bucket", cost=15, weight=4, soft=false},
    ["1-2, 1, 4"]   = {name="Cauldron", cost=180, weight=20, soft=false},
    ["1-2, 1, 5"]   = {name="Chopsticks", cost=1, weight=0, soft=false},
    ["1-2, 1, 6"]   = {name="Cup", cost=0.5, weight=0.15, soft=false},
    ["1-2, 2, 1"]   = {name="Dinner Plate", cost=2, weight=0.5, soft=false},
    ["1-2, 2, 2"]   = {name="Drinking Set", cost=7, weight=3, soft=false},
    ["1-2, 2, 3"]   = {name="Cooking Fork", cost=10, weight=2, soft=false},
    ["1-2, 2, 4"]   = {name="Table Fork", cost=3, weight=0.4, soft=false},
    ["1-2, 2, 5"]   = {name="Goblet", cost=5, weight=0.5, soft=false},
    ["1-2, 2, 6"]   = {name="Table Knife", cost=2.5, weight=0.4, soft=false},
    ["1-2, 3, 1"]   = {name="Ladle", cost=9, weight=2, soft=false},
    ["1-2, 3, 2"]   = {name="Mortar and Pestle", cost=20, weight=6, soft=false},
    ["1-2, 3, 3"]   = {name="Pitcher", cost=2.5, weight=3, soft=false},
    ["1-2, 3, 4"]   = {name="Place Setting", cost=5, weight=2, cb=get_place_setting, soft=false},
    ["1-2, 3, 5"]   = {name="Platter", cost=0.75, weight=1, soft=false},
    ["1-2, 3, 6"]   = {name="Pot", cost=30, weight=2, soft=false},
    ["1-2, 4, 1"]   = {name="Frying Pan", cost=50, weight=8, soft=false},
    ["1-2, 4, 2"]   = {name="Cooking Spit", cost=100, weight=15, soft=false},
    ["1-2, 4, 3"]   = {name="Tea Set", cost=6, weight=4.5, soft=false},
    ["1-2, 4, 4"]   = {name="Iron Teapot", cost=45, weight=7, soft=false},
    ["1-2, 4, 5"]   = {name="Wine Glass", cost=10, weight=0.5, soft=false},
    -- Decor          
    ["1-2, 4, 6"]   = {name="Banner", cost=5, weight=0.5, soft=true},
    ["1-2, 5, 1"]   = {name="Brazier", cost=65, weight=3, soft=false},
    ["1-2, 5, 2"]   = {name="Candlestick", cost=4, weight=1, soft=false},
    ["1-2, 5, 3"]   = {name="Incense Burner", cost=60, weight=2, soft=false},
    ["1-2, 5, 4"]   = {name="Complex Clock", cost=1000, weight=25, soft=false},
    ["1-2, 5, 5"]   = {name="Simple Clock", cost=400, weight=15, soft=false},
    ["1-2, 5, 6"]   = {name="Music Box", cost=120, weight=2, soft=false},
    -- Paintings      
    ["1-2, 6, 1"]   = {name="Wax Painting", cost=700, weight=0.75, soft=false, cb=get_painting},
    ["1-2, 6, 2"]   = {name="Oil Painting", cost=600, weight=0.75, soft=false, cb=get_painting},
    ["1-2, 6, 3"]   = {name="Watercolor Painting", cost=400, weight=0.75, soft=false, cb=get_painting},
    ["1-2, 6, 4"]   = {name="Pennant", cost=1, weight=0.1, soft=true, cb=get_pennant},
    -- Sculptures     
    ["1-2, 6, 5-6"] = {name="Clay Sculpture", cost=200, weight=95, soft=false, cb=get_sculpture},
    ["3-4, 1, 1"]   = {name="Bone Sculpture", cost=240, weight=38, soft=false, cb=get_sculpture},
    ["3-4, 1, 2"]   = {name="Porcelain Sculpture", cost=380, weight=100, soft=false, cb=get_sculpture},
    ["3-4, 1, 3-4"] = {name="Stone Sculpture", cost=165, weight=165, soft=false, cb=get_sculpture},
    ["3-4, 1, 5-6"] = {name="Wood Sculpture", cost=175, weight=32, soft=false, cb=get_sculpture},
    ["3-4, 2, 1"]   = {name="Ivory Sculpture", cost=460, weight=45, soft=false, cb=get_sculpture},
    -- Furniture    
    ["3-4, 2, 2"]   = {name="Bench", cost=160, weight=25, soft=false},
    ["3-4, 2, 3"]   = {name="Chair", cost=90, weight=12, soft=false},
    ["3-4, 2, 4"]   = {name="Folding Chair", cost=75, weight=8, soft=false},
    ["3-4, 2, 5"]   = {name="Couch", cost=600, weight=140, soft=true},
    ["3-4, 2, 6"]   = {name="Footstool", cost=160, weight=25, soft=true},
    ["3-4, 3, 1"]   = {name="Headrest", cost=8, weight=3, soft=false},
    ["3-4, 3, 2"]   = {name="Mattress", cost=850, weight=30, soft=true},
    ["3-4, 3, 3"]   = {name="Pillow", cost=70, weight=2, soft=true},
    ["3-4, 3, 4-5"] = {name="Carpet", cost=45, weight=1, soft=true, cb=get_carpet},
    ["3-4, 3, 6"]   = {name="Sheets", cost=35, weight=2, soft=true},
    ["3-4, 4, 1"]   = {name="Table", cost=120, weight=18, soft=false},
    ["3-4, 4, 2"]   = {name="Folding Table", cost=90, weight=15, soft=false},
    ["3-4, 4, 3-4"] = {name="Tapestry", cost=40, weight=0.75, soft=true, cb=get_tapestry},
    ["3-4, 4, 5"]   = {name="Tub", cost=300, weight=100, soft=false},
    -- Grooming
    ["3-4, 4, 6"]   = {name="Brush", cost=6, weight=0.5, soft=false},
    ["3-4, 5, 1"]   = {name="Comb", cost=3, weight=0.2, soft=false},
    ["3-4, 5, 2"]   = {name="Cosmetics", cost=40, weight=1/16, soft=false, cb=get_cosmetics},
    ["3-4, 5, 3"]   = {name="Grooming Kit", cost=80, weight=3, soft=false},
    ["3-4, 5, 4"]   = {name="Razor", cost=30, weight=0.1, soft=false},
    ["3-4, 5, 5"]   = {name="Scissors", cost=35, weight=0.3, soft=false},
    ["3-4, 5, 6"]   = {name="Strigil", cost=6, weight=0.5, soft=false},
    -- Personal Items
    ["3-4, 6, 1"]   = {name="Fan", cost=10, weight=0.25, soft=true},
    ["3-4, 6, 2"]   = {name="Mask", cost=25, weight=0.25, soft=false},
    ["3-4, 6, 3"]   = {name="Parasol", cost=12, weight=3, soft=true},
    ["3-4, 6, 4"]   = {name="Canopy Parasol", cost=108, weight=27, soft=true},
    ["3-4, 6, 5"]   = {name="Pipe", cost=1, weight=0.25, soft=false},
    ["3-4, 6, 6"]   = {name="Seal", cost=55, weight=1.5, soft=false},
    ["5-6, 1, 1"]   = {name="Staff", cost=7, weight=5, soft=false},
    ["5-6, 1, 2"]   = {name="Tinderbox", cost=2, weight=0, soft=false},
    ["5-6, 1, 3"]   = {name="Walking Stick", cost=4, weight=2, soft=false},
    ["5-6, 1, 4"]   = {name="Wand", cost=3, weight=1, soft=false},
    ["5-6, 1, 5"]   = {name="Water Pipe", cost=5, weight=4, soft=false},
    ["5-6, 1, 6"]   = {name="Large Wig", cost=500, weight=6, soft=true},
    ["5-6, 2, 1"]   = {name="Small Wig", cost=75, weight=1, soft=true},
    -- Scientific Instruments
    ["5-6, 2, 2"]   = {name="Abacus", cost=50, weight=2, soft=false},
    ["5-6, 2, 3"]   = {name="Armillary Sphere", cost=200, weight=4, soft=false},
    ["5-6, 2, 4"]   = {name="Astrolabe", cost=250, weight=5, soft=false},
    ["5-6, 2, 5"]   = {name="Globe", cost=25, weight=2, soft=false},
    ["5-6, 2, 6"]   = {name="Orrery", cost=750, weight=12, soft=false},
    ["5-6, 3, 1"]   = {name="Quadrant", cost=35, weight=3, soft=false},
    -- Sewing and Fiber Tools
    ["5-6, 3, 2"]   = {name="Knitting Needles", cost=5, weight=0, soft=false},
    ["5-6, 3, 3"]   = {name="Portable Loom", cost=36, weight=5, soft=false},
    ["5-6, 3, 4"]   = {name="Sewing Needles", cost=15, weight=0, soft=false},
    ["5-6, 3, 5"]   = {name="Spindle", cost=4, weight=0.5, soft=false},
    ["5-6, 3, 6"]   = {name="Spinning Wheel", cost=100, weight=40, soft=false},
    -- Toys and Amusements
    ["5-6, 4, 1"]   = {name="Ball", cost=3, weight=0.25, soft=true},
    ["5-6, 4, 2"]   = {name="Dice", cost=6, weight=0, soft=false},
    ["5-6, 4, 3"]   = {name="Board Game", cost=40, weight=3, soft=false},
    ["5-6, 4, 4"]   = {name="Game Tiles", cost=22, weight=1.5, soft=false},
    ["5-6, 4, 5"]   = {name="Kite", cost=33, weight=2, soft=true},
    ["5-6, 4, 6"]   = {name="Playing Cards", cost=50, weight=0.25, soft=false},
    ["5-6, 5, 1"]   = {name="Top", cost=3, weight=0.1, soft=false},
    -- Toy Figures
    ["5-6, 5, 2"]   = {name="Toy Boat", cost=4, weight=0.5, soft=false},
    ["5-6, 5, 3"]   = {name="Toy Castle", cost=4, weight=0.5, soft=false},
    ["5-6, 5, 4"]   = {name="Toy Chariot", cost=4, weight=0.5, soft=false},
    ["5-6, 5, 5"]   = {name="Toy House", cost=4, weight=0.5, soft=false},
    ["5-6, 5, 6"]   = {name="Toy Monster", cost=4, weight=0.5, soft=true},
    ["5-6, 6, 1"]   = {name="Toy Animal", cost=4, weight=0.5, soft=true},
    ["5-6, 6, 2"]   = {name="Toy Person", cost=4, weight=0.5, soft=true},
    ["5-6, 6, 3"]   = {name="Toy Soldier", cost=4, weight=0.5, soft=false},
    ["5-6, 6, 4"]   = {name="Toy Exotic Animal", cost=4, weight=0.5, soft=true},
    ["5-6, 6, 5"]   = {name="Toy Weapon", cost=4, weight=0.5, soft=false},
    ["5-6, 6, 6"]   = {name="Mechanical Toy", cf=8, cb=get_mechanical_toy},
}

function get_household_item(treasure_entry)
    local roll_result = roll_string("1d, 1d, 1d")
    local household_entry = household_items_table[roll_result]
    if household_entry.cb then
        return household_entry:cb()
    else
        return {{
            name = household_entry.name,
            cost = household_entry.cost,
            weight = household_entry.weight
        }}
    end
end

