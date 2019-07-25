nr_inv = {
	modpath = minetest.get_modpath("nr_inv")
}

-- Load support for intllib.
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/3rd-party/intllib.lua")

local function dofile(filename) -- this way I only need to write the relative path
	_G.dofile(nr_inv.modpath .. '/' .. filename)
end

dofile("api.lua")

local basic_inv = [[
list[current_player;main;0,0;5,5;]
container[6, 0]
	list[current_player;craft;0,0;3,3]
	image[1,3;1,1;gui_furnace_arrow_bg.png^[transform2]
	list[current_player;craftpreview;1,4;1,1]
container_end[]

list[current_player;armor;0,5.25;5,1;]
list[current_player;coins;0,6.25;5,1;]

list[current_player;gear;6.0,5.25;3,1;]
list[current_player;gear;6.5,6.25;2,1;3]
]]

nr_inv.register_tab("nr_inv:home", {
	content = basic_inv,
	display = S("Inventory"),
	width  = 9,
	height = 7
})