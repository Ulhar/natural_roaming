local tooltip = default.tooltip

minetest.register_tool("equipment:climbing_axe", {
	description = tooltip("Climbing Axe", "used to scale craggy rock"),
	_while_wielding = function(dtime, user, btns)
		if false then return end
		
		local STC = "default:CLIMBABLE_AIR"
		local N1, N2 = minetest.get_node(user:get_pos()).name, minetest.get_node(vector.add(user:get_pos(), vector.new(0, 1, 0))).name
		
		if N1 == STC or N2 == STC then
			playerphysics.add_physics_factor(user, "jump",    "climbing", 0)
			
			local velocity = user:get_player_velocity()
			
			local desired_speed = vector.new(0, btns.up and user:get_look_dir().y or 0, 0)
			
			local off = velocity.y - desired_speed.y
			
			-- Figure out climbing and whatnot
			local grav = 0
			
			if math.abs(off) >= 0.25 then
				grav = -desired_speed.y
			--elseif off <= -0.25 then
			--	grav = -1
			end
			
			playerphysics.add_physics_factor(user, "gravity", "climbing", grav)
		else
			playerphysics.remove_physics_factor(user, "jump",    "climbing")
			playerphysics.remove_physics_factor(user, "gravity", "climbing")
		end
	end,
	inventory_image = "equipment_climbing_axe.png"
})

minetest.register_tool("equipment:gravity_suit", {
	description = tooltip("Gravity Suit", "hold JUMP to fall up\nhold SNEAK to stop accelerating vertically"),
	_while_wielding = function(dtime, user, btns)
		if btns.sneak then
			playerphysics.add_physics_factor(user, "speed",   "grav_suit",     3)
			playerphysics.add_physics_factor(user, "jump",    "grav_suit",     5)
			playerphysics.add_physics_factor(user, "gravity", "grav_suit",     0)
			playerphysics.add_physics_factor(user, "sneak",   "grav_suit", false)
		elseif btns.jump then
			playerphysics.add_physics_factor(user, "speed",   "grav_suit",    1)
			playerphysics.add_physics_factor(user, "jump",    "grav_suit",   -1)
			playerphysics.add_physics_factor(user, "gravity", "grav_suit",    1)
			playerphysics.add_physics_factor(user, "sneak",   "grav_suit", true)
		else
			playerphysics.remove_physics_factor(user, "speed",   "grav_suit")
			playerphysics.remove_physics_factor(user, "jump",    "grav_suit")
			playerphysics.remove_physics_factor(user, "gravity", "grav_suit")
			playerphysics.remove_physics_factor(user, "sneak",   "grav_suit")
		end
	end,
	inventory_image = "equipment_gravity_suit.png"
})

minetest.register_tool("equipment:glider", {
	description = tooltip("Glider", "hold JUMP while falling to glide"),
	_while_wielding = function(dtime, user, btns)
		local speed = user:get_player_velocity().y
		if (speed < -0.1) and btns.jump then
			
			if     speed < -2    then
				playerphysics.add_physics_factor(user, "speed",   "glider",  1.75)
				playerphysics.add_physics_factor(user, "gravity", "glider",    -1)
			elseif speed < -0.95 then
				playerphysics.add_physics_factor(user, "speed",   "glider",  1.50)
				playerphysics.add_physics_factor(user, "gravity", "glider",     0)
			else
				playerphysics.add_physics_factor(user, "speed",   "glider",  1.25)
				playerphysics.add_physics_factor(user, "gravity", "glider",   0.5)
			end
		else
			playerphysics.remove_physics_factor(user, "speed",   "glider")
			playerphysics.remove_physics_factor(user, "gravity", "glider")
		end
	end,
	inventory_image = "equipment_glider.png"
})