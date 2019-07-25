--[[
   init.lua: start point of the DEFAULT mod of Natural Roaming
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

default = {modpath = minetest.get_modpath("default")}
local function dofile(filename) -- this way I only need to write the relative path
	_G.dofile(default.modpath .. '/' .. filename)
end

local s, c = minetest.settings:to_table(), {}
for key, val in pairs(s) do
	if key:sub(1, 7) == 'keymap_' then
		while val:sub(1, 4) == "KEY_" do
			val = val:sub(5, #val)
		end
		c[key:sub(8, #key)] = val
	end
end
c.descend = (s.aux1_descends == 'true') and c.special1 or c.sneak
default.controls, default.settings = c, s -- you never know, they might come in handy

minetest.register_item(":", {
	type = "none",
	-- rather than make a transparent image, we'll do this
	wield_image = "heart.png^[opacity:0",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level = 0,
		groupcaps = {
			crumbly = {times={[2]=3.00, [3]=0.70}, uses=0, maxlevel=1},
			snappy = {times={[3]=0.40}, uses=0, maxlevel=1},
			oddly_breakable_by_hand = {times={[1]=3.50,[2]=2.00,[3]=0.70}, uses=0}
		},
		damage_groups = {fleshy=1},
	},
	on_place = function(user, itemstack, pointedthing)
		minetest.spawn_tree(pointedthing.above, {
			axiom="FFFFFAFFBF",
			rules_a="[&&&FFFFF&&FFFF][&&&++++FFFFF&&FFFF][&&&----FFFFF&&FFFF]",
			rules_b="[&&&++FFFFF&&FFFF][&&&--FFFFF&&FFFF][&&&------FFFFF&&FFFF]",
			trunk="default:log",
			leaves="default:leaves",
			angle=30,
			iterations=2,
			random_level=0,
			trunk_type="crossed",
			thin_branches=true,
			fruit_chance=0,
			fruit="default:magma"
		})
	end
})

-- inventory stuff is now in nr_inv

dofile('api.lua')
dofile('nodes.lua')
dofile('workbench.lua')
dofile('liquids.lua')
dofile('mapgen.lua')
-- tools are defined in the Toolcraft mod
dofile('items.lua') -- Let's take a small break and make some aliases
for key, val in pairs(minetest.registered_items) do
	if key:sub(1, 8) == "default:" then -- don't create aliases for things in other mods
		minetest.register_alias(key:sub(9, #key), key)
	end
end -- also the end of our small break
dofile('recipes.lua')
