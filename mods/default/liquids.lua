minetest.register_node('default:water', {
	description = "Water",
	inventory_image = "default:water",
	
	drawtype = "liquid",
	tiles = {
		{
			name = "default_water_source_animated.png",
			animation = {
				type = "vertical_frames",
				backface_culling = false,
				aspect_w = 16,
				-- ^ specify width of a frame in pixels
				aspect_h = 16,
				-- ^ specify height of a frame in pixels
				length = 1,
				-- ^ specify full loop length
			}
		},
		{
			name = "default_water_source_animated.png",
			animation = {
				type = "vertical_frames",
				backface_culling = true,
				aspect_w = 16,
				-- ^ specify width of a frame in pixels
				aspect_h = 16,
				-- ^ specify height of a frame in pixels
				length = 1,
				-- ^ specify full loop length
			}
		}
	},
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	
	liquidtype = "source", -- "none"/"source"/"flowing"
	liquid_alternative_source = "default:water", -- Source version of flowing liquid
	liquid_alternative_flowing = "default:flowing_water", -- Flowing version of source liquid
	liquid_viscosity = 1, -- Higher viscosity = slower flow (max. 7)
	liquid_renewable = true,
	drowning = 1, -- Player will take this amount of damage if no bubbles are left
	groups = {water = 3, liquid = 3, cools_lava = 1},
})

minetest.register_node('default:flowing_water', {
	description = "Water (flowing HEY WAIT A MINUTE)",
	drawtype = "flowingliquid",
	tiles = {"default_water.png"},
	special_tiles = {
		{
			name = "default_water_flowing_animated.png",
			animation = {
				type = "vertical_frames",
				backface_culling = false,
				aspect_w = 16,
				-- ^ specify width of a frame in pixels
				aspect_h = 16,
				-- ^ specify height of a frame in pixels
				length = 1,
				-- ^ specify full loop length
			}
		},
		{
			name = "default_water_flowing_animated.png",
			animation = {
				type = "vertical_frames",
				backface_culling = true,
				aspect_w = 16,
				-- ^ specify width of a frame in pixels
				aspect_h = 16,
				-- ^ specify height of a frame in pixels
				length = 1,
				-- ^ specify full loop length
			}
		}
	},
	alpha = 160,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	
	liquidtype = "flowing", -- "none"/"source"/"flowing"
	liquid_alternative_source = "default:water", -- Source version of flowing liquid
	liquid_alternative_flowing = "default:flowing_water", -- Flowing version of source liquid
	liquid_viscosity = 1, -- Higher viscosity = slower flow (max. 7)
	liquid_renewable = true,
	drowning = 1, -- Player will take this amount of damage if no bubbles are left
	groups = {water = 3, liquid = 3, cools_lava = 1},
})

minetest.register_node('default:river_water', {
	description = "River Water",
	inventory_image = "default:river_water",
	
	drawtype = "liquid",
	tiles = {
		{
			name = "default_river_water_source_animated.png",
			animation = {
				type = "vertical_frames",
				backface_culling = false,
				aspect_w = 16,
				-- ^ specify width of a frame in pixels
				aspect_h = 16,
				-- ^ specify height of a frame in pixels
				length = 1,
				-- ^ specify full loop length
			}
		},
		{
			name = "default_river_water_source_animated.png",
			animation = {
				type = "vertical_frames",
				backface_culling = true,
				aspect_w = 16,
				-- ^ specify width of a frame in pixels
				aspect_h = 16,
				-- ^ specify height of a frame in pixels
				length = 1,
				-- ^ specify full loop length
			}
		}
	},
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	
	liquidtype = "source", -- "none"/"source"/"flowing"
	liquid_alternative_source = "default:river_water", -- Source version of flowing liquid
	liquid_alternative_flowing = "default:flowing_river_water", -- Flowing version of source liquid
	liquid_viscosity = 1, -- Higher viscosity = slower flow (max. 7)
	liquid_renewable = true,
	drowning = 1, -- Player will take this amount of damage if no bubbles are left
	groups = {water = 3, liquid = 3, cools_lava = 1, not_in_creative_inventory = 1},
})

minetest.register_node('default:flowing_river_water', {
	description = "River Water (flowing HEY WAIT A MINUTE)",
	drawtype = "flowingliquid",
	tiles = {"default_river-water.png"},
	special_tiles = {
		{
			name = "default_river_water_flowing_animated.png",
			animation = {
				type = "vertical_frames",
				backface_culling = false,
				aspect_w = 16,
				-- ^ specify width of a frame in pixels
				aspect_h = 16,
				-- ^ specify height of a frame in pixels
				length = 1,
				-- ^ specify full loop length
			}
		},
		{
			name = "default_river_water_flowing_animated.png",
			animation = {
				type = "vertical_frames",
				backface_culling = true,
				aspect_w = 16,
				-- ^ specify width of a frame in pixels
				aspect_h = 16,
				-- ^ specify height of a frame in pixels
				length = 1,
				-- ^ specify full loop length
			}
		}
	},
	alpha = 160,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	
	liquidtype = "flowing", -- "none"/"source"/"flowing"
	liquid_alternative_source = "default:river_water", -- Source version of flowing liquid
	liquid_alternative_flowing = "default:flowing_river_water", -- Flowing version of source liquid
	liquid_viscosity = 1, -- Higher viscosity = slower flow (max. 7)
	liquid_renewable = true,
	drowning = 1, -- Player will take this amount of damage if no bubbles are left
	groups = {water = 3, liquid = 3, cools_lava = 1, not_in_creative_inventory = 1},
})

minetest.register_node('default:magma', {
	description = "Magma",
	inventory_image = "default_lava",
	
	drawtype = "liquid",
	tiles = {
		{
			name = "default_lava_source_animated.png",
			animation = {
				type = "vertical_frames",
				backface_culling = false,
				aspect_w = 16,
				-- ^ specify width of a frame in pixels
				aspect_h = 16,
				-- ^ specify height of a frame in pixels
				length = 4,
				-- ^ specify full loop length
			}
		},
		{
			name = "default_lava_source_animated.png",
			animation = {
				type = "vertical_frames",
				backface_culling = true,
				aspect_w = 16,
				-- ^ specify width of a frame in pixels
				aspect_h = 16,
				-- ^ specify height of a frame in pixels
				length = 4,
				-- ^ specify full loop length
			}
		}
	},
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	
	liquidtype = "source", -- "none"/"source"/"flowing"
	liquid_alternative_source = "default:magma", -- Source version of flowing liquid
	liquid_alternative_flowing = "default:flowing_magma", -- Flowing version of source liquid
	liquid_viscosity = 4, -- Higher viscosity = slower flow (max. 7)
	liquid_range = 4,
	liquid_renewable = false,
	drowning = 20, -- Player will take this amount of damage if no bubbles are left
	groups = {water = 3, liquid = 3, cools_lava = 1},
	
	light_source = minetest.LIGHT_MAX,
})

minetest.register_node('default:flowing_magma', {
	description = "Magma (flowing HEY WAIT A MINUTE)",
	drawtype = "flowingliquid",
	tiles = {"default_lava.png"},
	special_tiles = {
		{
			name = "default_lava_flowing_animated.png",
			animation = {
				type = "vertical_frames",
				backface_culling = false,
				aspect_w = 16,
				-- ^ specify width of a frame in pixels
				aspect_h = 16,
				-- ^ specify height of a frame in pixels
				length = 1,
				-- ^ specify full loop length
			}
		},
		{
			name = "default_lava_flowing_animated.png",
			animation = {
				type = "vertical_frames",
				backface_culling = true,
				aspect_w = 16,
				-- ^ specify width of a frame in pixels
				aspect_h = 16,
				-- ^ specify height of a frame in pixels
				length = 1,
				-- ^ specify full loop length
			}
		}
	},
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	
	liquidtype = "flowing", -- "none"/"source"/"flowing"
	liquid_alternative_source = "default:magma", -- Source version of flowing liquid
	liquid_alternative_flowing = "default:flowing_magma", -- Flowing version of source liquid
	liquid_viscosity = 4, -- Higher viscosity = slower flow (max. 7)
	liquid_range = 4,
	liquid_renewable = false,
	drowning = 20, -- Player will take this amount of damage if no bubbles are left
	groups = {magma = 2, liquid = 2, not_in_creative_inventory = 1},
	
	light_source = minetest.LIGHT_MAX,
})