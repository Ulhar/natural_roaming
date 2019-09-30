--[[
   nodes.lua: registering nodes for the DEFAULT mod of Natural Roaming
   Copyright (C) 2019  TheBluePineapple
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.
   
]]--

local empty_inv = {}
while #empty_inv < 36 do
	table.insert(empty_inv, "")
end

local S, NS = dofile(default.modpath .. "/3rd-party/intllib.lua")

-- I imagine this will help
local tooltip = default.tooltip

-- Fancy way to add all the colored bricks
for _, C in ipairs({"Red", "Green", "Blue", "Yellow", "Gray"}) do
	local c = C:lower()
	minetest.register_node("default:" .. c .. "_bricks", {
		description = C .. " Bricks",
		tiles = {"default_" .. c .. "-bricks.png"},
		groups = {cracky = 3}
	})
end

local __s = "default_gold_block.png"
local __f = __s .. "^default_golden_clock.png"
minetest.register_node("default:golden_clock", {
	description = tooltip(S("Golden Clock"), S("after placing, right-click to set the time to 7:30")),
	inventory_image = "default_golden_clock.png",
	wield_image = "default_golden_clock.png",
	tiles = {__f, __s, __s, __s, __s, __s},
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		minetest.set_timeofday(730 / 2400)
		return itemstack
	end,
	groups = {cracky = 3}
})

local function register_ladder(name, display, image, groups, coloring, on_place)
	minetest.register_node(name, {
		description = display,
		drawtype = "signlike",
		tiles = {image},
		inventory_image = image,
		wield_image = image,
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		walkable = false,
		climbable = true,
		is_ground_content = false,
		selection_box = {
			type = "wallmounted",
			--wall_top = = <default>
			--wall_bottom = = <default>
			--wall_side = = <default>
		},
		groups = groups,
		on_place = on_place
	})
end

register_ladder("default:platinum_ladder", S("Platinum Ladder"), "default_ladder_platinum.png", {cracky = 3})
register_ladder(   "default:steel_ladder",    S("Steel Ladder"),    "default_ladder_steel.png", {cracky = 3})
register_ladder(    "default:wood_ladder",     S("Wood Ladder"),     "default_ladder_wood.png", {snappy = 2})
register_ladder(    "default:rope_ladder",     S("Rope Ladder"),     "default_ladder_rope.png", {dig_immediate = 2}, nil, function(itemstack, placer, pointed)
	local pointed_node = minetest.get_node(pointed.under)
	local extended_coords = vector.subtract(pointed.under, vector.new(0, 1, 0))
	
	if pointed_node.name == "default:rope_ladder" then
		while minetest.get_node(extended_coords).name == "default:rope_ladder" do
			extended_coords = vector.subtract(extended_coords, vector.new(0, 1, 0))
		end
		if minetest.get_node(extended_coords).name == "air" then
			minetest.set_node(extended_coords, {name = "default:rope_ladder", param2 = pointed_node.param2})
			itemstack:take_item()
			return itemstack
		end
	else
		minetest.item_place(itemstack, placer, pointed)
	end
end
)

minetest.register_node("default:log", {
	description = S("Log"),
	tiles = {
		"default_tree_top.png",
		"default_tree_top.png",
		"default_tree.png",
		"default_tree.png",
		"default_tree.png",
		"default_tree.png"
	},
	paramtype2 = "facedir",
	on_place = minetest.rotate_and_place,
	groups = {wood = 1, tree = 1, choppy = 3},
})

minetest.register_node("default:leaves", {
	description = S("Leaves"),
	tiles = {"default_leaves.png"},
	special_tiles = {"default_leaves_simple.png"},
	drawtype = "allfaces_optional",
	waving = 1,
	
	drop = {
		max_items = 1,
		items = {
			{
				items = {"default:twig"},  -- Items to drop.
				rarity = 3,  -- Probability of dropping is 1 / rarity.
			},
			{
				items = {"default:leaves"},  -- Items to drop.
				rarity = 1,  -- Probability of dropping is 1 / rarity.
			}
		}
	},
	
	walkable = false,
	climbable = true,
	
	paramtype = "light",
	sunlight_propagates = true,
	on_place = minetest.rotate_and_place,
	groups = {leaf = 1, snappy = 3},
})

minetest.register_node("default:grass", {
	description = tooltip(S("Grass"), S("smells nice in the morning...")),
	tiles = {"default_grass.png"},
	groups = {snappy = 3, crumbly = 3}
})

minetest.register_node("default:snow", {
	description = S("Snow"),
	tiles = {"default_snow.png"},
	groups = {snappy = 3, crumbly = 3}
})

minetest.register_node("default:ice", {
	description = S("Ice"),
	tiles = {"default_ice.png"},
	groups = {slippery = 1, dig_immediate = 2},
	paramtype = "light",
	alpha = 200
})

minetest.register_node("default:dirt", {
	description = S("Dirt"),
	tiles = {"default_dirt.png"},
	groups = {crumbly = 3}
})

minetest.register_node("default:stone", {
	description = S("Stone"),
	tiles = {"default_stone.png"},
	groups = {cracky = 3},
	drop = "default:cobble"
})

minetest.register_node("default:cobble", {
	description = S("Cobble"),
	tiles = {"default_cobble.png"},
	groups = {cracky = 3}
})

minetest.register_node("default:gravel", {
	description = tooltip(S("Gravel"), S("TROUBLE LIES UNDERFOOT")),
	tiles = {"default_gravel.png"},
	groups = {crumbly = 3}
})

default.register_rock("default:diorite", {
	description = tooltip(S("Diorite"), S("Can be climbed if you have a Climbing Axe equipped")),
	tiles = {"default_climbable_stone.png"},
	groups = {cracky = 3}
})

minetest.register_node("default:crate", {
	description = S("Crate"),
	tiles = {"default_crate.png"},
	groups = {choppy = 3},
	on_construct = function(pos)
		minetest.get_meta(pos):from_table({
			inventory = {
				main = empty_inv
			},
			fields = {
				formspec = [[
					size[15,6]
					
					container[0,0]
						list[context;main;0,0;6,6;]
					container_end[]
					
					container[6.5,0.5]
						list[current_player;main;0,0;5,5;]
						listring[]
						container[5.25, 0]
							list[current_player;craft;0,0;3,3]
							image[1,3;1,1;gui_furnace_arrow_bg.png^[transform2]
							list[current_player;craftpreview;1,4;1,1]
						container_end[]
					container_end[]
				]],
				infotext = "Crate"
			}
		})
	end,
	can_dig = function(pos)
		return minetest.get_inventory({type="node", pos=pos}):is_empty("main")
	end
})

minetest.register_node("default:planks", {
	description = S("Planks"),
	tiles = {"default_wood.png"},
	groups = {wood = 1, planks = 1, choppy = 3},
})

minetest.register_node("default:plank_slab", {
	drawtype = "nodebox",
	paramtype = "light",
	description = S("Plank Slab"),
	tiles = {{
		name = "default_wood.png",
		backface_culling = true,
		align_style = "world"
	}},
	groups = {choppy = 3},
	node_box = {
		-- A fixed box (or boxes) (facedir param2 is used, if applicable)
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
	}
})

minetest.register_node("default:plank_platform", {
	drawtype = "nodebox",
	paramtype = "light",
	description = S("Plank Platform"),
	tiles = {"default_wood.png"},
	groups = {choppy = 3},
	node_box = {
		-- A fixed box (or boxes) (facedir param2 is used, if applicable)
		type = "fixed",
		fixed = {-0.5, 0.25, -0.5, 0.5, 0.5, 0.5}
	}
})

minetest.register_node("default:plank_stairs", {
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	description = S("Plank Stairs"),
	tiles = {{
		name = "default_wood.png",
		backface_culling = true,
		align_style = "world"
	}},
	groups = {choppy = 3, dig_immediate = 3},
	node_box = {
		-- A fixed box (or boxes) (facedir param2 is used, if applicable)
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
			{-0.5, 0, 0, 0.5, 0.5, 0.5}
		}
	},
	on_place = minetest.rotate_node,
})

-- workbench is now in its own file

minetest.register_node("default:wooden_pole", {
	drawtype = "nodebox",
	paramtype = "light",
	description = S("Wooden Pole"),
	tiles = {"default_wood.png"},
	groups = {choppy = 3},
	node_box = {
		-- A fixed box (or boxes) (facedir param2 is used, if applicable)
		type = "fixed",
		fixed = {-0.125, -0.5, -0.125, 0.125, 0.5, 0.125}
	}
})

minetest.register_node("default:lantern", {
	description = tooltip(S("Lantern"), S("Other than magma, this is the only thing that emits light")),
	inventory_image = "default_lantern.png",
	wield_image = "default_lantern.png",
	
	light_source = minetest.LIGHT_MAX,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625,    -0.5, -0.0625, 0.0625,    0, 0.0625},
			{-0.1875, -0.0625, -0.1875, 0.1875,    0, 0.1875},
			{-0.1875, -0.4375, -0.1875, 0.1875, -0.5, 0.1875},
			
			{-0.1875,    -0.5, -0.1875, -0.125,    0, -0.125},
			{-0.1875,    -0.5,  0.1875, -0.125,    0,  0.125},
			{ 0.1875,    -0.5, -0.1875,  0.125,    0, -0.125},
			{ 0.1875,    -0.5,  0.1875,  0.125,    0,  0.125},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.1875,    -0.5, -0.1875, 0.1875,    0, 0.1875}
		}
	},
	tiles = {
		"default_lantern_top.png",
		"default_lantern_top.png",
		"default_lantern.png",
		"default_lantern.png",
		"default_lantern.png",
		"default_lantern.png"
	},
	groups = {dig_immediate = 3}
})

minetest.register_node("default:glass", {
	description = S("Glass"),
	tiles = {"default_glass.png"},
	drawtype = "glasslike",
	paramtype = "light",
	groups = {dig_immediate = 3}
})

minetest.register_node("default:framed_glass", {
	description = S("Framed Glass"),
	tiles = {"default_framed_glass.png"},
	drawtype = "glasslike",
	paramtype = "light",
	groups = {dig_immediate = 2}
})