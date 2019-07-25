-- These are recipes for built-in items
minetest.register_craft({
	output = "toolsys:wooden_handle",
	recipe = {{""}, {"default:wood_rod"}, {"default:wood_rod"}}
})

minetest.register_craft({
	output = "toolsys:steel_handle",
	recipe = {{""}, {"default:steel_rod"}, {"default:steel_rod"}}
})

minetest.register_craft({
	output = "toolsys:platinum_handle",
	recipe = {{""}, {"default:platinum_rod"}, {"default:platinum_rod"}}
})


minetest.register_craft({
	output = "toolsys:platinum_pick",
	recipe = {
		{'default:platinum_ingot', 'default:platinum_ingot', 'default:platinum_ingot'},
		{'', '', ''},
		{'', '', ''}
	}
})

minetest.register_craft({
	output = "toolsys:platinum_axe",
	recipe = {
		{'default:platinum_ingot', 'default:platinum_ingot'},
		{'default:platinum_ingot', ''},
		{'', ''}
	}
})

minetest.register_craft({
	output = "toolsys:platinum_spade",
	recipe = {
		{'default:platinum_ingot'},
		{''},
		{''}
	}
})