noms = {
	modpath = minetest.get_modpath("noms"),
	register_food = function(name, def)
		local def = table.copy(def)
		def.on_use = minetest.item_eat(def._gain, def._replace_with)
		noms.registered_foods[name] = def
		minetest.register_craftitem(name, def)
	end,
	registered_foods = {},
}

local registered_foods = noms.registered_foods

-- I prefer relative paths
local function dofile(filename)
	_G.dofile(noms.modpath .. '/' .. filename)
end

local function hunger_of(player)
	local h = player:get_attribute("hunger")
	if h then
		return tonumber(player:get_attribute("hunger"))
	end
end

local function set_hunger_of(player, hunger)
	local new_hunger = math.min(hunger, 20)
	
	if p then
		hb.change_hudbar(player, "hunger", new_hunger)
	else
		player:hud_change(noms.HUDs[player:get_player_name()], "number", new_hunger)
	end
	
	return player:set_attribute("hunger", new_hunger)
end

local p = minetest.get_modpath("hudbars")
p = (p ~= nil) and (p ~= "")
noms.HUDs = (not p) and {} or nil
local hunger_bar_definition = (not p) and {
	hud_elem_type = "statbar",
	position = { x=0.5, y=1 },
	text = "noms_food-icon.png",
	number = 20,
	direction = 0,
	size = { x=24, y=24 },
	offset = {x=25,y=-(48+24+16)},
} or nil
if p then
	hb.register_hudbar("hunger", 0xFFFFFF, "Hunger", {icon = "noms_food-icon.png", bar = "noms_barslice.png"}, 20, 20, false)
else
	-- We want breath bar to be above hunger
	local breath_bar_definition = {
		hud_elem_type = "statbar",
		position = { x=0.5, y=1 },
		text = "bubble.png",
		number = core.PLAYER_MAX_BREATH_DEFAULT,
		direction = 0,
		size = { x=24, y=24 },
		offset = {x=25,y=-(48+48+16)},
	}
	minetest.hud_replace_builtin("breath", breath_bar_definition)
end

minetest.register_on_joinplayer(function(player)
	if not (player:is_player() and player:get_player_name() ~= "" and minetest.settings:get_bool("enable_damage")) then
		return
	end
	
	if not hunger_of(player) then set_hunger_of(player, 20) end
	
	if p then
		hb.init_hudbar(player, "hunger", hunger_of(player), 20, false)
	else
		local def = table.copy(hunger_bar_definition)
		def.number = hunger_of(player)
		noms.HUDs[player:get_player_name()] = player:hud_add(def)
	end
end)

minetest.register_on_leaveplayer(function(player)
	if minetest.settings:get_bool("enable_damage") or not player:is_player() then
		return
	end
	
	if not p then
		noms.HUDs[player] = nil
	end
end)

-- When player eats, the gain goes to hunger. Any overflow from this goes to health instead.
minetest.register_on_item_eat(function(hp_change, replace_with_item, itemstack, user, pointed_thing)
	if not (user:is_player() and #user:get_player_name() > 0) then return itemstack end
	
	local p_hunger = hunger_of(user)
	if p_hunger == 20 then return itemstack end
	
	local p_hp = user:get_hp()
	local actual_hp_gain = math.min(math.max(p_hunger + hp_change - 20, 0), 20 - p_hp)
	
	set_hunger_of(user, p_hunger + hp_change)
	user:set_hp(p_hp + actual_hp_gain)
	
	itemstack:take_item()
	return itemstack
end)

-- When player respawns, their hunger should be reset
minetest.register_on_respawnplayer(function(player)
	set_hunger_of(player, 20)
end)

creative.register_tab("noms_food", "Food", registered_foods)

dofile("builtin_food.lua")