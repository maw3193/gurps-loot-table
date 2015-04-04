local note1 = "Item sheds light as a torch"
supernatural_embellishment_table = expand_table{
    -- Sensation Aura
    ["1-2, 1-2, 1"] = {name="Cold Aura", cf=-0.1},
    ["1-2, 1-2, 2"] = {name="Sorrow Aura", cf=-0.1},
    ["1-2, 1-2, 3"] = {name="Joy Aura", cf=0.1},
    ["1-2, 1-2, 4"] = {name="Fear Aura", cf=-0.1},
    ["1-2, 1-2, 5"] = {name="Confusion Aura", cf=-0.1},
    -- Animate Features
    ["1-2, 1-2, 6"] = {name="Features Rolling Clouds", cf=1},
    ["1-2, 3-4, 1"] = {name="Features Running Water", cf=1},
    ["1-2, 3-4, 2"] = {name="Features Moving Stars", cf=1},
    ["1-2, 3-4, 3"] = {name="Features Shifting Textures", cf=1},
    ["1-2, 3-4, 4"] = {name="Features Moving Figures", cf=1},
    -- Noisy Operation
    ["1-2, 3-4, 5"] = {name="Musical Chiming When Used", cf=1},
    ["1-2, 3-4, 6"] = {name="Wordless Singing When Used", cf=1},
    ["1-2, 5-6, 1"] = {name="Pained Screaming When Used", cf=1},
    ["1-2, 5-6, 2"] = {name="Thunderclap When Used", cf=1},
    -- Scent
    ["1-2, 5-6, 3"] = {name="Faint Smell of Flowers", cf=1},
    ["1-2, 5-6, 4"] = {name="Faint Smell of Spices", cf=1},
    ["1-2, 5-6, 5"] = {name="Faint Smell of Blood", cf=-0.1},
    ["1-2, 5-6, 6"] = {name="Faint Smell of Decay", cf=-0.25},
    ["3-4, 1-2, 1"] = {name="Faint Smell of Brimstone", cf=-0.1},
    ["3-4, 1-2, 2"] = {name="Faint Smell of Smoke", cf=0.1},
    -- Visible Trail
    ["3-4, 1-2, 3"] = {name="Sparkling Motes Trail", cf=1},
    ["3-4, 1-2, 4"] = {name="Faint Glow Trail", cf=1},
    ["3-4, 1-2, 5"] = {name="Pale Mist Trail", cf=1},
    ["3-4, 1-2, 6"] = {name="Black Mist Trail", cf=1},
    -- Implausible Material
    ["3-4, 3-4, 1"] = {name="Made of Basalt", cf=2},
    ["3-4, 3-4, 2"] = {name="Made of Bone", cf=1},
    ["3-4, 3-4, 3"] = {name="Made of Darkness", cf=2},
    ["3-4, 3-4, 4"] = {name="Made of Ebony", cf=2},
    ["3-4, 3-4, 5"] = {name="Made of Flame", cf=4, notes=note1},
    ["3-4, 3-4, 6"] = {name="Made of Flower Petals", cf=2},
    ["3-4, 5-6, 1"] = {name="Made of Ice", cf=4},
    ["3-4, 5-6, 2"] = {name="Made of Sandstone", cf=2},
    ["3-4, 5-6, 3"] = {name="Made of Seashell", cf=4},
    -- Other Embellishment
    ["3-4, 5-6, 4"] = {name="Faint Glow", cf=2},
    ["3-4, 5-6, 5"] = {name="Glowing Parts", cf=4},
    ["3-4, 5-6, 6"] = {name="Spectral", cf=1},
    ["5-6, 1-2, 1"] = {name="Spirit Aura", cf=1},
    ["5-6, 1-2, 2"] = {name="Blurry", cf=0.1},
    ["5-6, 1-2, 3"] = {name="Altered Reflection", cf=0.25},
    ["5-6, 1-2, 4"] = {name="Casts no shadow", cf=0.5},
    ["5-6, 1-2, 5"] = {name="Casts a shadow at the wrong angle", cf=0.1},
    ["5-6, 1-2, 6"] = {name="Flashes brightly when used", cf=1.5},
    ["5-6, 3-4, 1"] = {name="Always Humming", cf=0.5},
    ["5-6, 3-4, 2"] = {name="Vibrates faintly when used", cf=0.1},
    ["5-6, 3-4, 3"] = {name="Always Warm", cf=0.1},
    ["5-6, 3-4, 4"] = {name="Always Cool", cf=0.1},
    ["5-6, 3-4, 5"] = {name="Always Points North", cf=1},
    ["5-6, 3-4, 6"] = {name="Always Level", cf=0.5},
    ["5-6, 5-6, 1"] = {name="Always Clean", cf=2},
    ["5-6, 5-6, 2"] = {name="Always Dirty", cf=-0.25},
    ["5-6, 5-6, 3"] = {name="Always Damp", cf=-0.1},
    ["5-6, 5-6, 4"] = {name="Always Dry", cf=0.25},
    ["5-6, 5-6, 5"] = {name="Always Bloody", cf=-0.5},
    ["5-6, 5-6, 6"] = {name="Empathic", cf=1}
}

function get_supernatural_embellishment()
    local roll_result = roll_string("1d, 1d, 1d")
    return supernatural_embellishment_table[roll_result]
end
