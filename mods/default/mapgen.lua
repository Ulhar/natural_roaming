local a = minetest.register_alias
local b = minetest.register_biome

a("mapgen_stone", "default:stone")

a("mapgen_water_source", "default:water")
a("mapgen_river_water_source", "default:river_water")
a("mapgen_lava_source", "default:magma")

b({
	name = "plains",
	node_dust = "",
	--  ^ Node dropped onto upper surface after all else is generated.
	node_top = "default:grass",
	depth_top = 1,
	--  ^ Node forming surface layer of biome and thickness of this layer.
	node_filler = "default:dirt",
	depth_filler = 3,
	--  ^ Node forming lower layer of biome and thickness of this layer.
	node_stone = "default:stone",
	--  ^ Node that replaces all stone nodes between roughly y_min and y_max.
	node_water_top = "",
	depth_water_top = 0,
	--  ^ Node forming a surface layer in seawater with the defined thickness.
	node_water = "default:water",
	--  ^ Node that replaces all seawater nodes not in the defined surface layer.
	node_river_water = "default:river_water",
	--  ^ Node that replaces river water in mapgens that use default:river_water.
	node_riverbed = "default:gravel",
	depth_riverbed = 2,
	--  ^ Node placed under river water and thickness of this layer.
	y_min = 1,
	y_max = 20000,
	--  ^ Lower and upper limits for biome.
	vertical_blend = 8,
	--  ^ Vertical distance in nodes above 'y_max' over which the biome will
	--  ^ blend with the biome above.
	--  ^ Set to 0 for no vertical blend. Defaults to 0.
	heat_point = 50,
	humidity_point = 50,
	--  ^ Characteristic temperature and humidity for the biome.
	--  ^ These values create 'biome points' on a voronoi diagram with heat and
	--  ^ humidity as axes. The resulting voronoi cells determine the
	--  ^ distribution of the biomes.
	--  ^ Heat and humidity have average values of 50, vary mostly between
	--  ^ 0 and 100 but can exceed these values.
})

b({
	name = "snow_plains",
	node_dust = "",
	--  ^ Node dropped onto upper surface after all else is generated.
	node_top = "default:snow",
	depth_top = 1,
	--  ^ Node forming surface layer of biome and thickness of this layer.
	node_filler = "default:dirt",
	depth_filler = 3,
	--  ^ Node forming lower layer of biome and thickness of this layer.
	node_stone = "default:stone",
	--  ^ Node that replaces all stone nodes between roughly y_min and y_max.
	node_water_top = "default:ice",
	depth_water_top = 2,
	--  ^ Node forming a surface layer in seawater with the defined thickness.
	node_water = "default:water",
	--  ^ Node that replaces all seawater nodes not in the defined surface layer.
	node_river_water = "default:river_water",
	--  ^ Node that replaces river water in mapgens that use default:river_water.
	node_riverbed = "default:gravel",
	depth_riverbed = 2,
	--  ^ Node placed under river water and thickness of this layer.
	y_min = 1,
	y_max = 20000,
	--  ^ Lower and upper limits for biome.
	vertical_blend = 8,
	--  ^ Vertical distance in nodes above 'y_max' over which the biome will
	--  ^ blend with the biome above.
	--  ^ Set to 0 for no vertical blend. Defaults to 0.
	heat_point = 10,
	humidity_point = 75,
	--  ^ Characteristic temperature and humidity for the biome.
	--  ^ These values create 'biome points' on a voronoi diagram with heat and
	--  ^ humidity as axes. The resulting voronoi cells determine the
	--  ^ distribution of the biomes.
	--  ^ Heat and humidity have average values of 50, vary mostly between
	--  ^ 0 and 100 but can exceed these values.
})


-- so much space
-- need to see it all
b({
	name = "space",
	node_dust = "",
	--  ^ Node dropped onto upper surface after all else is generated.
	node_top = "",
	depth_top = 1,
	--  ^ Node forming surface layer of biome and thickness of this layer.
	node_filler = "",
	depth_filler = 0,
	--  ^ Node forming lower layer of biome and thickness of this layer.
	node_stone = "default:diorite",
	--  ^ Node that replaces all stone nodes between roughly y_min and y_max.
	node_water_top = "",
	depth_water_top = 0,
	--  ^ Node forming a surface layer in seawater with the defined thickness.
	node_water = "",
	--  ^ Node that replaces all seawater nodes not in the defined surface layer.
	node_river_water = "",
	--  ^ Node that replaces river water in mapgens that use default:river_water.
	node_riverbed = "",
	depth_riverbed = 0,
	--  ^ Node placed under river water and thickness of this layer.
	y_min = 20001,
	y_max = 31000,
	--  ^ Lower and upper limits for biome.
	vertical_blend = 8,
	--  ^ Vertical distance in nodes above 'y_max' over which the biome will
	--  ^ blend with the biome above.
	--  ^ Set to 0 for no vertical blend. Defaults to 0.
	heat_point = 0,
	humidity_point = 0,
	--  ^ Characteristic temperature and humidity for the biome.
	--  ^ These values create 'biome points' on a voronoi diagram with heat and
	--  ^ humidity as axes. The resulting voronoi cells determine the
	--  ^ distribution of the biomes.
	--  ^ Heat and humidity have average values of 50, vary mostly between
	--  ^ 0 and 100 but can exceed these values.
})

--[[b({
	name = "tundra",
	node_dust = "default:snow",
	--  ^ Node dropped onto upper surface after all else is generated.
	node_top = "default:dirt_with_snow",
	depth_top = 1,
	--  ^ Node forming surface layer of biome and thickness of this layer.
	node_filler = "default:permafrost",
	depth_filler = 3,
	--  ^ Node forming lower layer of biome and thickness of this layer.
	node_stone = "default:bluestone",
	--  ^ Node that replaces all stone nodes between roughly y_min and y_max.
	node_water_top = "default:ice",
	depth_water_top = 10,
	--  ^ Node forming a surface layer in seawater with the defined thickness.
	node_water = "",
	--  ^ Node that replaces all seawater nodes not in the defined surface layer.
	node_river_water = "default:ice",
	--  ^ Node that replaces river water in mapgens that use default:river_water.
	node_riverbed = "default:gravel",
	depth_riverbed = 2,
	--  ^ Node placed under river water and thickness of this layer.
	y_min = 1,
	y_max = 31000,
	--  ^ Lower and upper limits for biome.
	vertical_blend = 8,
	--  ^ Vertical distance in nodes above 'y_max' over which the biome will
	--  ^ blend with the biome above.
	--  ^ Set to 0 for no vertical blend. Defaults to 0.
	heat_point = 0,
	humidity_point = 50,
	--  ^ Characteristic temperature and humidity for the biome.
	--  ^ These values create 'biome points' on a voronoi diagram with heat and
	--  ^ humidity as axes. The resulting voronoi cells determine the
	--  ^ distribution of the biomes.
	--  ^ Heat and humidity have average values of 50, vary mostly between
	--  ^ 0 and 100 but can exceed these values.
})]]