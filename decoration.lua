require "gems"

local note_bells = "Gives -1 to Stealth if worn or carried openly"
-- "motif" means that the decoration can have a motif
soft_decoration_table = {
    ["1, 1-2"] = {name="Fine Material", cf=2, motif=false},
    ["1, 3-4"] = {name="Exceptional Material", cf=19, motif=false},
    ["1, 5"]   = {name="Cheap Dye", cf=1.5, motif=false},
    ["1, 6"]   = {name="Average Dye", cf=4, motif=false},
    ["2, 1"]   = {name="Expensive Dye", cf=8, motif=false},
    ["2, 2"]   = {name="Block Printing", cf=0.5, motif=true},
    ["2, 3"]   = {name="Resist Dyed", cf=2.5, motif=true},
    ["2, 4"]   = {name="Branding", cf=0.5, motif=true},
    ["2, 5"]   = {name="Cheap Patchwork", cf=2, motif=true},
    ["2, 6"]   = {name="Expensive Patchwork", cf=5, motif=true},
    ["3, 1-2"] = {name="Cheap Fringe", cf=1, motif=false},
    ["3, 3"]   = {name="Expensive Fringe", cf=6, motif=false},
    ["3, 4-5"] = {name="Minimal Lace", cf=3.5, motif=true},
    ["3, 6"]   = {name="Extensive Lace", cf=9, motif=true},
    ["4, 1"]   = {name="Simple Feathers", cf=0.5, motif=false},
    ["4, 2"]   = {name="Elaborate Feathers", cf=4, motif=false},
    ["4, 3"]   = {name="Cheap Fur Trim", cf=3, motif=false},
    ["4, 4"]   = {name="Expensive Fur Trim", cf=8, motif=false},
    ["4, 5-6"] = {name="Minimal Cheap Beading", cf=1.5, motif=true},
    ["5, 1"]   = {name="Extensive Cheap Beading", cf=4, motif=true},
    ["5, 2"]   = {name="Minimal Extensive Beading", cf=3, motif=true},
    ["5, 3"]   = {name="Extensive Expensive Beading", cf=7, motif=true},
    ["5, 4"]   = {name="Cheap Bells", cf=3, motif=false, notes=note_bells},
    ["5, 5"]   = {name="Expensive Bells", cf=10, motif=false, notes=note_bells},
    ["5, 6"]   = {name="Minimal Embroidery", cf=2, motif=true},
    ["6, 1"]   = {name="Extensive Embroidery", cf=5, motif=true},
    ["6, 2"]   = {name="Minimal Tattoo", cf=2, motif=true},
    ["6, 3"]   = {name="Extensive Tattoo", cf=6, motif=true},
    ["6, 4"]   = {name="Woven Tapestry", cf=6, motif=true},
    ["6, 5"]   = {name="Quilting", cf=4, motif=false},
    ["6, 6"]   = {name="Patchwork Quilt", cf=8, motif=false}
}
expand_table(soft_decoration_table)

hard_decoration_table = {
    ["1-2, 1"] = {name="Fine Material", cf=2, motif=false},
    ["1-2, 2"] = {name="Exceptional Material", cf=19, motif=false},
    ["1-2, 3"] = {name="Cheap Fringe", cf=0.25, motif=false},
    ["1-2, 4"] = {name="Expensive Fringe", cf=0.5, motif=false},
    ["1-2, 5"] = {name="Minimal Beads/Nails", cf=0.75, motif=true},
    ["1-2, 6"] = {name="Extensive Beads/Nails", cf=2, motif=true},
    ["3-4, 1"] = {name="Branding", cf=1, motif=true},
    ["3-4, 2"] = {name="Minimal Paint/Enamel", cf=2, motif=true},
    ["3-4, 3"] = {name="Extensive Paint/Enamel", cf=5, motif=true},
    ["3-4, 4"] = {name="Minimal Relief", cf=1.5, motif=true},
    ["3-4, 5"] = {name="Extensive Relief", cf=4, motif=true},
    ["3-4, 6"] = {name="Minimal Cheap Inlay", cf=2.5, motif=true},
    ["5-6, 1"] = {name="Extensive Cheap Inlay", cf=7, motif=true},
    ["5-6, 2"] = {name="Minimal Expensive Inlay", cf=6, motif=true},
    ["5-6, 3"] = {name="Extensive Expensive Inlay", cf=14, motif=true},
    ["5-6, 4"] = {name="Silver Plating", cf=2, motif=false},
    ["5-6, 5"] = {name="Gilding", cf=19, motif=false},
    -- TODO: Implement jeweled decorations
    ["5-6, 6"] = {name="Jeweled", cf=0, motif=false}
}
expand_table(hard_decoration_table)

motif_table = {
    -- Animals/Monsters
    ["1-2, 1, 1"] = "Alligator/Crocodile",
    ["1-2, 1, 2"] = "Ape",
    ["1-2, 1, 3"] = "Bear",
    ["1-2, 1, 4"] = "Bird of Prey",
    ["1-2, 1, 5"] = "Cat",
    ["1-2, 1, 6"] = "Cattle",
    ["1-2, 2, 1"] = "Deer/Elk",
    ["1-2, 2, 2"] = "Demon",
    ["1-2, 2, 3"] = "Dog",
    ["1-2, 2, 4"] = "Dragon",
    ["1-2, 2, 5"] = "Elephant/Mammoth",
    ["1-2, 2, 6"] = "Exotic Bird",
    ["1-2, 3, 1"] = "Fish",
    ["1-2, 3, 2"] = "Horse",
    ["1-2, 3, 3"] = "Hybrid",
    ["1-2, 3, 4"] = "Insect",
    ["1-2, 3, 5"] = "Leopard",
    ["1-2, 3, 6"] = "Lion",
    ["1-2, 4, 1"] = "Domestic Animal",
    ["1-2, 4, 2"] = "Shark",
    ["1-2, 4, 3"] = "Small Prey Animal",
    ["1-2, 4, 4"] = "Snake",
    ["1-2, 4, 5"] = "Squid/Octopus",
    ["1-2, 4, 6"] = "Tiger",
    ["1-2, 5, 1"] = "Wolf",
    -- Humanoids
    ["1-2, 5, 2"] = "Builder",
    ["1-2, 5, 3"] = "Child",
    ["1-2, 5, 4"] = "Cook",
    ["1-2, 5, 5"] = "Craftsman",
    ["1-2, 5, 6"] = "Dancer",
    ["1-2, 6, 1"] = "Herdsman",
    ["1-2, 6, 2"] = "Hunter",
    ["1-2, 6, 3"] = "Laborer",
    ["1-2, 6, 4"] = "Magician",
    ["1-2, 6, 5"] = "Musician",
    ["1-2, 6, 6"] = "Priest",
    ["3-4, 1, 1"] = "Ruler",
    ["3-4, 1, 2"] = "Sage",
    ["3-4, 1, 3"] = "Seamstress/Tailor",
    ["3-4, 1, 4"] = "Skeleton",
    ["3-4, 1, 5"] = "Warrior",
    -- Landscapes
    ["3-4, 1, 6"] = "Castle/Palace",
    ["3-4, 2, 1"] = "City",
    ["3-4, 2, 2"] = "Desert",
    ["3-4, 2, 3"] = "Fields",
    ["3-4, 2, 4"] = "Forest/Jungle",
    ["3-4, 2, 5"] = "Meadow",
    ["3-4, 2, 6"] = "Mountains",
    ["3-4, 3, 1"] = "Ocean/Lake",
    ["3-4, 3, 2"] = "River",
    ["3-4, 3, 3"] = "Tavern/Inn",
    ["3-4, 3, 4"] = "Temple",
    ["3-4, 3, 5"] = "Village",
    -- Objects
    ["3-4, 3, 6"] = "Armor/Shield",
    ["3-4, 4, 1"] = "Boat",
    ["3-4, 4, 2"] = "Carriage",
    ["3-4, 4, 3"] = "Chariot",
    ["3-4, 4, 4"] = "Craft Tool", 
    ["3-4, 4, 5"] = "Farming Tool",
    ["3-4, 4, 6"] = "Garment",
    ["3-4, 5, 1"] = "Ship",
    ["3-4, 5, 2"] = "Wagon",
    ["3-4, 5, 3"] = "Weapon",
    -- Abstract
    ["3-4, 5, 4-6"] = "Arabesque",
    ["3-4, 6, 1-6"] = "Simple Geometric Pattern",
    ["5-6, 1, 1-6"] = "Symbol",
    ["5-6, 2, 1-4"] = "Flowers/Vines",
    ["5-6, 2, 5-6"] = "Emulation",
    ["5-6, 3, 1-6"] = "Complex Geometric Pattern",
    ["5-6, 4, 1-6"] = "Calligraphy",
    ["5-6, 5, 1-6"] = "Scene",
    ["5-6, 6, 1-6"] = "Narrative"
}
expand_table(motif_table)

-- returns a table containing cost factor, decoration string and flat cost
function get_decoration(is_soft)
    local roll_result = roll_string("1d, 1d")
    local decoration_entry
    if is_soft then
        decoration_entry = soft_decoration_table[roll_result]
    else
        decoration_entry = hard_decoration_table[roll_result]
    end

    if decoration_entry.name == "Jeweled" then
        local gem_count = math.random(1, 2)
        local decoration_string = ""
        local gem_value = 0
        local decors = {}
        for i=1, gem_count do
            table.insert(decors, get_gem())
        end
        return decors
    end

    if decoration_entry.motif == true then
        local motif_entry = motif_table[roll_string("1d, 1d, 1d")]
        local decoration_string = string.format("%s depicting a %s", decoration_entry.name, motif_entry)
        return {{cf=decoration_entry.cf, name=decoration_string, cost=0}}
    else
        local decoration_string = decoration_entry.name
        return {{cf=decoration_entry.cf, name=decoration_string, cost=0}}
    end
end
