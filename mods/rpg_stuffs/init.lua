rpg_stuffs = {}

local function race_tex(race)
	local base = ("rpgstuff_<race>_<face>.png"):gsub("<race>", race)
	return base:gsub("<face>", "front"), base:gsub("<face>", "back")
end

local function reset_tex(player)
	player:set_properties({
		textures = {race_tex(player:get_attribute("race") or "nilh")}
	})
end

minetest.register_on_joinplayer(reset_tex)

minetest.register_privilege("race_switch", {description = "Allows you to defy logic and change your race", give_to_singleplayer = false})

minetest.register_chatcommand("race", {
	params = "[race]", -- Short parameter description
	description = "show/set your race", -- Full description
	privs = {race_switch = true}, -- Require the "race_switch" privilege to run
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		
		if #param > 0 then
			player:set_attribute("race", param)
			reset_tex(player)
			return true, "changed race to " .. param
		else
			return true, player:get_attribute("race") or "nilh"
		end
	end
})