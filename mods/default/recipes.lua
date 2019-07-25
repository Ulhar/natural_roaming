local c = minetest.register_craft

c({
    output = 'default:platinum_ladder 3',
    recipe = {
        {'default:platinum_rod', '',                     'default:platinum_rod'},
        {'default:platinum_rod', 'default:platinum_rod', 'default:platinum_rod'},
        {'default:platinum_rod', '',                     'default:platinum_rod'},
    }
})

c({
    output = 'default:steel_ladder 3',
    recipe = {
        {'default:steel_rod', '',                  'default:steel_rod'},
        {'default:steel_rod', 'default:steel_rod', 'default:steel_rod'},
        {'default:steel_rod', '',                  'default:steel_rod'},
    }
})

c({
    output = 'default:wood_ladder 3',
    recipe = {
        {'default:wood_rod', '',                 'default:wood_rod'},
        {'default:wood_rod', 'default:wood_rod', 'default:wood_rod'},
        {'default:wood_rod', '',                 'default:wood_rod'},
    }
})

c({
    output = 'default:rope_ladder 3',
    recipe = {
        {'default:rope',     '',                 'default:rope'    },
        {'default:wood_rod', 'default:wood_rod', 'default:wood_rod'},
        {'default:rope',     '',                 'default:rope'    },
    }
})


c({
	output = 'default:platinum_rod 8',
	recipe = {{'default:platinum_ingot'}, {'default:platinum_ingot'}}
})

c({
	output = 'default:steel_rod 8',
	recipe = {{'default:steel_ingot'}, {'default:steel_ingot'}}
})

c({
	output = 'default:wood_rod 8',
	recipe = {{'default:planks'}, {'default:planks'}}
})


c({
    output = 'default:rope_coil',
    recipe = {
        {'default:rope', 'default:rope', 'default:rope'},
        {'default:rope', 'default:rope', 'default:rope'},
        {'default:rope', 'default:rope', 'default:rope'},
    }
})

c({
    output = 'default:rope 9',
    recipe = {{'default:rope_coil'}}
})

c({
	output = 'default:crate',
	recipe = {
		{'group:planks', 'group:planks', 'group:planks'},
		{'group:planks', '', 'group:planks'},
		{'group:planks', 'group:planks', 'group:planks'}
	}
})

c({
	output = "default:rope 3",
	recipe = {
		{"default:string", "default:string", "default:string"},
		{"default:string", "default:string", "default:string"}
	}
})

c({
	output = "default:plank_stairs 8",
	recipe = {
		{"", "", "default:planks"},
		{"", "default:planks", "default:planks"},
		{"default:planks", "default:planks", "default:planks"}
	}
})

c({
	output = "default:planks 3",
	recipe = {
		{"default:plank_stairs", "default:plank_stairs"},
		{"default:plank_stairs", "default:plank_stairs"}
	}
})

c({
	output = "default:plank_slab 6",
	recipe = {{"default:planks", "default:planks", "default:planks"}}
})

c({
	output = "default:planks 3",
	recipe = {
		{"default:plank_slab", "default:plank_slab", "default:plank_slab"},
		{"default:plank_slab", "default:plank_slab", "default:plank_slab"}
	}
})

c({
	output = "default:plank_platform 6",
	recipe = {{"default:plank_slab", "default:plank_slab", "default:plank_slab"}}
})

c({
	output = "default:plank_slab 3",
	recipe = {
		{"default:plank_platform", "default:plank_platform", "default:plank_platform"},
		{"default:plank_platform", "default:plank_platform", "default:plank_platform"}
	}
})