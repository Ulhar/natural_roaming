local ts = toolsys


minetest.register_craftitem("toolsys:wooden_handle", {
	stack_max = 33,
	description = "Wooden Handle",
	inventory_image = "toolsys_wooden-handle.png"
})
ts.register_handle("toolsys:wooden_handle", {
	uses = 33
})

minetest.register_craftitem("toolsys:steel_handle", {
	stack_max = 33,
	description = "Steel Handle",
	inventory_image = "toolsys_steel-handle.png"
})
ts.register_handle("toolsys:steel_handle", {
	uses = 66
})

minetest.register_craftitem("toolsys:platinum_handle", {
	stack_max = 33,
	description = "Platinum Handle",
	inventory_image = "toolsys_platinum-handle.png"
})
ts.register_handle("toolsys:platinum_handle", {
	uses = 99
})


minetest.register_craftitem("toolsys:platinum_axe", {
	stack_max = 33,
	description = "Platinum Axe Head",
	inventory_image = "toolsys_platinum-axe.png"
})
ts.register_toolhead("toolsys:platinum_axe", {
	tool_capabilities = {
        full_punch_interval = 2.5,
        max_drop_level = 0,
        groupcaps = {
            choppy = {times = {[1] = 1.75, [2] = 1.25, [3] = 0.75}, uses = 99, maxlevel = 1},
        },
        damage_groups = {fleshy = 7},
    }
})

minetest.register_craftitem("toolsys:platinum_spade", {
	stack_max = 33,
	description = "Platinum Spade Head",
	inventory_image = "toolsys_platinum-spade.png"
})
ts.register_toolhead("toolsys:platinum_spade", {
	tool_capabilities = {
        full_punch_interval = 5,
        max_drop_level = 0,
        groupcaps = {
            crumbly = {times = {[1] = 1.25, [2] = 0.75, [3] = 0.25}, uses = 99, maxlevel = 1},
        },
        damage_groups = {fleshy = 7},
    }
})

minetest.register_craftitem("toolsys:platinum_pick", {
	stack_max = 33,
	description = "Platinum Pick Head",
	inventory_image = "toolsys_platinum-pick.png"
})
ts.register_toolhead("toolsys:platinum_pick", {
	tool_capabilities = {
        full_punch_interval = 3,
        max_drop_level = 0,
        groupcaps = {
            cracky = {times = {[1] = 1.5, [2] = 1.0, [3] = 0.5}, uses = 99, maxlevel = 1},
        },
        damage_groups = {fleshy = 7},
    }
})