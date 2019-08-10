rpgs.registered_races = {}
rpgs.register_race = function(name, def)
	def = def or {}
	
	local modname = minetest.get_current_modname()
	if modname == "rpg_stuffs" then modname = "rpgstuff" end
	
	def.texture = def.texture or modname .. "_<race>_<face>.png"
	
	rpgs.registered_races[name] = def
end

local default_props = {
	hp_max = minetest.PLAYER_MAX_HP_DEFAULT,
	eye_height = 1.625,
	weight = 5,
	collisionbox = {-0.3, 0.0, -0.3, 0.3, 1.75, 0.3}
}

local function race_tex(race, player)
	local race_def = rpgs.registered_races[race]
	
	local base
	if     type(race_def.texture) == "string"   then
		base = race_def.texture
	elseif type(race_def.texture) == "function" then
		base = race_def.texture(player)
	end
	
	local base2 = base:gsub("<race>", race)
	return base2:gsub("<face>", "front"), base2:gsub("<face>", "back")
end

local function reset_player(player)
	local race = player:get_attribute("race") or "nilh"
	local race_def = rpgs.registered_races[race]
	
	player:set_properties({
		textures = {race_tex(race, player)}
	})
	
	player:set_properties(default_props)
	
	if race_def.props then player:set_properties(race_def.props) end
	
	for key, val in pairs(race_def.phys_factors or {}) do
		playerphysics.add_physics_factor(player, key, "RACE_" .. race, val)
	end
end

minetest.register_on_joinplayer(reset_player)
minetest.register_on_joinplayer(function(player)
	minetest.log("warning", dump(player:get_properties()))
end)

minetest.register_privilege("race_switch", {description = "Allows you to defy logic and change your race", give_to_singleplayer = false})

minetest.register_chatcommand("race", {
	params = "[race]", -- Short parameter description
	description = "show/set your race", -- Full description
	privs = {race_switch = true}, -- Require the "race_switch" privilege to run
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		
		if #param > 0 then
			if rpgs.registered_races[param] then
				local old = player:get_attribute("race") or "nilh"
				for key, val in pairs(rpgs.registered_races[old].phys_factors or {}) do
					playerphysics.remove_physics_factor(player, key, "RACE_" .. old)
				end
				player:set_attribute("race", param)
				reset_player(player)
				return true, "changed race to " .. param .. player:get_attribute("playerphysics:physics")
			else
				return false, "race \"" .. param .. "\" doesn't exist D:"
			end
		else
			return true, player:get_attribute("race") or "nilh"
		end
	end
})

rpgs.register_race("nilh")
rpgs.register_race("human")
rpgs.register_race("kobold", {
	props = {
		hp_max = minetest.PLAYER_MAX_HP_DEFAULT - 2,
		eye_height = 1.5,
		weight = 4.75,
		collisionbox = {-0.299, 0.0, -0.299, 0.299, 1.7, 0.299}
	},
	phys_factors = {
		speed = 1.1,
		jump  = 1.1
	}
})