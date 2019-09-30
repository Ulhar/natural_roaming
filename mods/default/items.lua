-- This seems irrelevant but some tooltips use the data
--local c = default.controls

-- I imagine this will help
local function tooltip(i, t, c)
	c = c or {}
	return minetest.colorize(c.name or 'white', n) .. '\n' .. minetest.colorize(c.tip or 'yellow', t)
end

-- Load support for intllib.
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/3rd-party/intllib.lua")


minetest.register_craftitem('default:platinum_ingot', {
	description = S("Platinum Ingot"),
	inventory_image = 'default_platinum_ingot.png'
})

minetest.register_craftitem('default:steel_ingot', {
	description = S("Steel Ingot"),
	inventory_image = 'default_steel_ingot.png'
})


minetest.register_craftitem('default:platinum_rod', {
	description = S("Platinum Rod"),
	inventory_image = 'default_platinum_rod.png'
})

minetest.register_craftitem('default:steel_rod', {
	description = S("Steel Rod"),
	inventory_image = 'default_steel_rod.png'
})

minetest.register_craftitem("default:twig", {
	description = S("Twig"),
	inventory_image = "default_stick.png"
})

minetest.register_craftitem('default:wood_rod', {
	description = S("Wood Rod"),
	inventory_image = 'default_wood_rod.png'
})

minetest.register_craftitem('default:string', {
	description = S("String"),
	inventory_image = 'default_string.png',
	groups = {string = 1}
})

minetest.register_craftitem('default:rope', {
	description = S("Rope"),
	inventory_image = 'default_rope.png',
	groups = {rope = 1}
})

minetest.register_craftitem('default:paracord', {
	description = S("Paracord"),
	inventory_image = 'default_rope.png',
	groups = {rope = 1}
})

minetest.register_craftitem('default:rope_coil', {
	description = S("Rope Coil"),
	inventory_image = 'default_rope_coil.png'
})

minetest.register_craftitem('default:paracord_bracelet', {
	description = S("Paracord Bracelet"),
	inventory_image = 'default_rope_coil.png'
})
