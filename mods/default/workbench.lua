--[[
   workbench.lua
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

local function func() end

local formspec = [[
	
]]

minetest.register_node("default:workbench", {
	tiles = {"default_planks.png"},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{   -0.5,  0.25,    -0.5,     0.5,     0.5,     0.5}, -- surface
			{-0.4375,  -0.5, -0.4375,   -0.25,    0.25,   -0.25}, -- leg1
			{-0.4375,  -0.5,    0.25,   -0.25,    0.25,  0.4375}, -- leg2
			{   0.25,  -0.5, -0.4375,  0.4375,    0.25,   -0.25}, -- leg3
			{ 0.4375,  -0.5,  0.4375,    0.25,    0.25,    0.25}, -- leg4
			{  -0.25,     0,  -0.375,    0.25,  0.0625, -0.3125}, -- beam1
			{  -0.25,     0,  0.3125,    0.25,  0.0625,   0.375}, -- beam2
			{ 0.3125, -0.25,   -0.25,   0.375, -0.1875,    0.25}, -- beam3
			{ -0.375, -0.25,   -0.25, -0.3125, -0.1875,    0.25}, -- beam4
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			-0.5, -0.5, -0.5,
			 0.5,  0.5,  0.5
		}
	},
	
	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		local meta = minetest.get_meta(pos)
		
		-- doing this because there's an idea I have involving placing this in schematics
		if not meta:to_table().inventory.craft then
			local inv = meta:get_inventory()
			
			inv:set_size ("craft", 9)
			inv:set_width("craft", 3)
			
			inv:set_size("tool", 1)
			inv:set_size("craft_result", 1)
		end
		
		minetest.show_formspec(player:get_player_name(), "default:workbench", formspec)
	end,
})

	allow_metadata_inventory_move = func(pos, from_list, from_index, to_list, to_index, count, player) --[[
	^ Called when a player wants to move items inside the inventory
	^ Return value: number of items allowed to move ]]
	
	allow_metadata_inventory_put = func(pos, listname, index, stack, player) --[[
	^ Called when a player wants to put something into the inventory
	^ Return value: number of items allowed to put
	^ Return value: -1: Allow and don't modify item count in inventory ]]
	
	allow_metadata_inventory_take = func(pos, listname, index, stack, player) --[[
	^ Called when a player wants to take something out of the inventory
	^ Return value: number of items allowed to take
	^ Return value: -1: Allow and don't modify item count in inventory ]]
	
	on_metadata_inventory_move = func(pos, from_list, from_index, to_list, to_index, count, player)
	on_metadata_inventory_put = func(pos, listname, index, stack, player)
	on_metadata_inventory_take = func(pos, listname, index, stack, player)