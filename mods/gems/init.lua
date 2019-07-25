--[[
   GEMS, a mod adding... well, gems to Natural Roaming
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
   
]]

-- Load support for intllib.
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/3rd-party/intllib.lua")

-- simplify this to some degree
local function register_gem(name, def)
	local img_name = name:gsub(":", "_")
	
	local ore = table.copy(def)
	ore.description = S("@1 Ore", ore.description)
	ore.tiles = {"default_stone.png^" .. img_name .. "_ore.png"}
	ore.groups = def._ore_groups or {}
	for key, val in pairs(def._ore_props or {}) do
		ore[key] = val
	end
	
	local gem = table.copy(def)
	gem.inventory_image = img_name .. ".png"
	gem.groups = def._gem_groups or {}
	for key, val in pairs(def._gem_props or {}) do
		gem[key] = val
	end
	
	for key, val in pairs(def.groups or {}) do
		ore.groups[key] = ore.groups[key] or val
		gem.groups[key] = gem.groups[key] or val
	end
	
	minetest.register_node     (name .. "_ore", ore)
	minetest.register_craftitem(          name, gem)
end

local function n() end

register_gem("gems:amethyst", {
	description = S("Amethyst"),
	_ore_groups = {cracky = 2},
	_ore_props = {drop = "gems:amethyst"},
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "gems:amethyst_ore",
	wherein = "default:stone",
	--^ a list of nodenames is supported too
	clust_scarcity = 12 ^ 3,
	--^ Ore has a 1 out of clust_scarcity chance of spawning in a node
	--^ If the desired average distance between ores is 'd', set this to d * d * d.
	clust_num_ores = 5,
	--^ Number of ores in a cluster
	clust_size = 3,
	--^ Size of the bounding box of the cluster
	--^ In this example, there is a 3 * 3 * 3 cluster where 8 out of the 27 nodes
	--^ are coal ore.
	y_min = -364,
	y_max = -64,
	--^ Lower and upper limits for ore.
})

register_gem("gems:rose_quartz", {
	description = S("Rose Quartz"),
	_ore_groups = {cracky = 2},
	_ore_props = {drop = "gems:rose_quartz"},
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "gems:rose_quartz_ore",
	wherein = "default:stone",
	--^ a list of nodenames is supported too
	clust_scarcity = 14 ^ 3,
	--^ Ore has a 1 out of clust_scarcity chance of spawning in a node
	--^ If the desired average distance between ores is 'd', set this to d * d * d.
	clust_num_ores = 5,
	--^ Number of ores in a cluster
	clust_size = 2,
	--^ Size of the bounding box of the cluster
	--^ In this example, there is a 3 * 3 * 3 cluster where 8 out of the 27 nodes
	--^ are coal ore.
	y_min = -464,
	y_max = -164,
	--^ Lower and upper limits for ore.
})

n({
	ore_type = "scatter",
	ore = "default:stone_with_coal",
	ore_param2 = 3,
	--^ Facedir rotation. Default is 0 (unchanged rotation)
	wherein = "default:stone",
	--^ a list of nodenames is supported too
	clust_scarcity = 8 * 8 * 8,
	--^ Ore has a 1 out of clust_scarcity chance of spawning in a node
	--^ If the desired average distance between ores is 'd', set this to d * d * d.
	clust_num_ores = 8,
	--^ Number of ores in a cluster
	clust_size = 3,
	--^ Size of the bounding box of the cluster
	--^ In this example, there is a 3 * 3 * 3 cluster where 8 out of the 27 nodes
	--^ are coal ore.
	y_min = -31000,
	y_max = 64,
	--^ Lower and upper limits for ore.
	flags = "",
	--^ Attributes for this ore generation, see 'Ore attributes' section above.
	noise_threshold = 0.5,
	--^ If noise is above this threshold, ore is placed. Not needed for a
	--^ uniform distribution.
	noise_params = {
		offset = 0,
		scale = 1,
		spread = {x = 100, y = 100, z = 100},
		seed = 23,
		octaves = 3,
		persist = 0.7
	},
	--^ NoiseParams structure describing one of the perlin noises used for ore
	--^ distribution.
	--^ Needed by "sheet", "puff", "blob" and "vein" ores.
	--^ Omit from "scatter" ore for a uniform ore distribution.
	--^ Omit from "stratum ore for a simple horizontal strata from y_min to y_max.
	biomes = {"desert", "rainforest"},
	--^ List of biomes in which this decoration occurs.
	--^ Occurs in all biomes if this is omitted, and ignored if the Mapgen being
	--^ used does not support biomes.
	--^ Can be a list of (or a single) biome names, IDs, or definitions.
	column_height_min = 1,
	column_height_max = 16,
	column_midpoint_factor = 0.5,
	--^ See 'Ore types' section above.
	--^ The above 3 parameters are only valid for "sheet" ore.
	np_puff_top = {
		offset = 4,
		scale = 2,
		spread = {x = 100, y = 100, z = 100},
		seed = 47,
		octaves = 3,
		persist = 0.7
	},
	np_puff_bottom = {
		offset = 4,
		scale = 2,
		spread = {x = 100, y = 100, z = 100},
		seed = 11,
		octaves = 3,
		persist = 0.7
	},
	--^ See 'Ore types' section above.
	--^ The above 2 parameters are only valid for "puff" ore.
	random_factor = 1.0,
	--^ See 'Ore types' section above.
	--^ Only valid for "vein" ore.
	np_stratum_thickness = {
		offset = 8,
		scale = 4,
		spread = {x = 100, y = 100, z = 100},
		seed = 17,
		octaves = 3,
		persist = 0.7
	},
	stratum_thickness = 8,
	--^ See 'Ore types' section above.
	--^ The above 2 parameters are only valid for "stratum" ore.
})