equipment = {
	modpath = minetest.get_modpath("equipment")
}

local function dofile(filename) -- this way I only need to write the relative path
	_G.dofile(equipment.modpath .. '/' .. filename)
end

dofile("builtin_gear.lua")

minetest.register_on_joinplayer(function(player)
	local inv = player:get_inventory()
	inv:set_size("gear", 5)
	
	player:hud_add({
		hud_elem_type = "inventory", -- see HUD element types
	--  ^ type of HUD element, can be either of "image", "text", "statbar", or "inventory"
		position = {x=0, y=0},
	--  ^ Left corner position of element
		name = "Gear display",
		text = "gear",
		number = 5,
		item = 0,
		direction = 0
	})
end)

minetest.register_globalstep(function(dtime)
	for _, player in ipairs(minetest.get_connected_players()) do
		local gear = player:get_inventory():get_list("gear")
		for Integer, Item in ipairs(gear) do
			local def = Item:get_definition()
			
			local func = def._while_wielding
			if func then func(dtime, player, player:get_player_control()) end
		end
	end
end)