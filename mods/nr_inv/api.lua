local n = nr_inv

-- Load support for intllib.
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/3rd-party/intllib.lua")

local mem = {}

local buttons = {
	help_button = {
		image = "gui_help.png",
		tooltip = S("Help"),
		on_click = function(player)
			doc.show_doc(player:get_player_name())
		end
	}
}

local tabs = {}
local tab_names = {}

function n.register_tab(name, def)
	def.name = name or def.name
	
	table.insert(tabs, def)
	table.insert(tab_names, def.display or name)
end

function n.set_tab(player, tab)
	mem[player].page = (tab > #tabs) and 1 or tab
	n.refresh(player)
end

function n.refresh(player)
	local page = mem[player].page
	local tab = tabs[page]
	local formspec = "size[" .. tab.width .. "," .. tab.height .. "]" .. tab.content .. "container[" .. (tab.width + 0.5) .. ",0]"
	
	local n = 0
	for key, val in pairs(buttons) do
		local button = ("image_button[0,<n>;1,1;<image>;<id>;;true;true;]tooltip[<id>;<tooltip>]")
			:gsub("<n>",       n)
			:gsub("<image>",   val.image)
			:gsub("<id>",      key)
			:gsub("<tooltip>", val.tooltip)
		
		formspec = formspec .. button
		
		n = n + 1
	end
	
	formspec = formspec .. "container_end[]" ..
	"tabheader[0,0;sys_tabs;" .. table.concat(tab_names, ",") .. ";" .. page .. ";false;true]"
	
	player:set_inventory_formspec(formspec)
end

-- this also sets up inventories
minetest.register_on_joinplayer(function(player)
	player:hud_set_hotbar_itemcount(8)
	player:hud_set_hotbar_image("gui_hotbar.png")
	player:hud_set_hotbar_selected_image("gui_hotbar_selected.png")
	player:set_eye_offset(vector.new(0, 0, 0), vector.new(-10, 0, 0))
	
	local inv = player:get_inventory()
	inv:set_size( "main", 32)
	inv:set_size("armor",  5)
	inv:set_size("coins",  5)
	
	mem[player] = {page = 1}
	n.refresh(player)
end)

minetest.register_on_leaveplayer(function(player)
	mem[player] = nil
end)

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname ~= "" then return end
	
	for key, val in pairs(buttons) do
		if fields[key] then
			val.on_click(player)
			return
		end
	end
	
	if fields.sys_tabs then
		n.set_tab(player, tonumber(fields.sys_tabs))
	end
end)