local n = nr_inv

n.invs = {}
local invs = n.invs

local callbacks = {
	
}

-- Load support for intllib.
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/3rd-party/intllib.lua")

-- this also sets up inventories (and third person camera because IDK)
minetest.register_on_joinplayer(function(player)
	-- idk why this is in this particular mod
	player:hud_set_hotbar_image("gui_hotbar.png")
	player:hud_set_hotbar_selected_image("gui_hotbar_selected.png")
	player:set_eye_offset(vector.new(0, 0, 0), vector.new(-10, 0, 0))
	
	local inv = player:get_inventory()
	inv:set_size("armor", 5)
	inv:set_size("coins", 5)
	
	local player_name = player:get_player_name()
	
	invs[player] = minetest.create_detached_inventory("_nrinv_" .. player_name, callbacks)
	invs[player_name] = invs[player]
end)

minetest.register_on_leaveplayer(function(player)
	local player_name = player:get_player_name()
	
	minetest.remove_detached_inventory("_nrinv_" .. player_name)
	invs[player], invs[player_name] = nil, nil
end)