if minetest.get_modpath("hudbars") then
    -- We don't want to show the default HUD
    local new_health = {
        hud_elem_type = "statbar",
        position = {x=0, y=0},
        name = "health",
        number = 0,
        scale = {x=2, y=2},
        text = "BLANK_AF.png",
        direction = 0,
        alignment = {x=0, y=0},
        offset = {x=0, y=0},
        size = { x=1, y=1 },
    }
    local new_breath = table.copy(new_health)
    new_breath.name = "breath"
    minetest.hud_replace_builtin('health', new_health)
    minetest.hud_replace_builtin('breath', new_breath)
end