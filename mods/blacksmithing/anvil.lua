-- GENERATED CODE
-- Node Box Editor, version 0.9.0
-- Namespace: test

minetest.register_node("test:anvil", {
	tiles = {
		"default_iron-block.png",
		"default_iron-block.png",
		"default_iron-block.png",
		"default_iron-block.png",
		"default_iron-block.png",
		"default_iron-block.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, 0.125, -0.5, 0.3125, 0.5, 0.3125}, -- surface
			{-0.25, 0.25, 0.3125, 0.25, 0.5, 0.5}, -- surface_point
			{-0.25, -0.5, -0.3125, 0.25, 0.125, 0.25}, -- stand
			{-0.375, -0.5, -0.4375, 0.375, -0.4375, 0.375}, -- base1
			{-0.3125, -0.4375, -0.375, 0.3125, -0.375, 0.3125}, -- base2
			{-0.1875, 0.1875, 0.3125, 0.1875, 0.25, 0.4375}, -- surface_point_lip
		}
	}
})

