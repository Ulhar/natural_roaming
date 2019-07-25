-- GENERATED CODE
-- Node Box Editor, version 0.9.0
-- Namespace: test

minetest.register_node("test:forge", {
	tiles = {
		"blacksmithing_lava_thing_top.png",
		"blacksmithing_lava_thing_top.png",
		"blacksmithing_lava_thing_side.png",
		"blacksmithing_lava_thing_side.png",
		"blacksmithing_lava_thing_side.png",
		"blacksmithing_lava_thing_side.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.25, 0.5}, -- base
			{-0.5, -0.25, -0.5, 0.5, -0.125, -0.375}, -- wall1
			{-0.5, -0.25, 0.375, 0.5, -0.125, 0.5}, -- wall2
			{-0.5, -0.25, -0.375, -0.375, -0.125, 0.375}, -- wall3
			{0.375, -0.25, -0.375, 0.5, -0.125, 0.375}, -- wall4
		}
	}
})

