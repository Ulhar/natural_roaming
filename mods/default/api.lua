-- Note: actual API starts at --[[ API ]], use your text editor's Find function

-- Node used by "rocks"
minetest.register_node("default:CLIMBABLE_AIR", {
	drawtype = "airlike",
	description = minetest.colorize("red", "Climbable Air\n(you shouldn't have this!)"),
	buildable_to = true,
	pointable = false,
	climbable = false,
	diggable = false,
	walkable = false,
	paramtype = 'light',
	sunlight_propagates = true,
	drops = ''
})

-- a table of directions
local check_these = {vector.new(1, 0, 0), vector.new(0, 0, 1), vector.new(-1, 0, 0), vector.new(0, 0, -1)}



--[[ API ]]
-- Creates a fancy tooltip
function default.tooltip(i, t, c)
	c = c or {}
	return minetest.colorize(c.item or 'white', i) .. '\n' .. minetest.colorize(c.tip or 'yellow', t)
end

-- Registers a node that can be climbed from adjacent nodes
-- /!\ you can't use the on_punch, on_construct or on_destruct functions
function default.register_rock(name, def)
	def.groups.rock_climbing_mechanics = 1
	def.on_construct = function(pos)
		for _, val in ipairs(check_these) do
			local pos = vector.add(val, pos)
			local node = minetest.get_node(pos)
			if node.name == "air" then
				minetest.set_node(pos, {name = "default:CLIMBABLE_AIR"})
			end
		end
	end
	def.on_destruct = function(_pos)
		for _, val in ipairs(check_these) do
			local pos = vector.add(val, _pos)
			local node = minetest.get_node(pos)
			if node.name == "default:CLIMBABLE_AIR" then
				-- In human-readable form: remove this air if there are no rocks next to it
				local p = {
					vector.add(check_these[1], pos),
					vector.add(check_these[2], pos),
					vector.add(check_these[3], pos),
					vector.add(check_these[4], pos)
				}
				
				local n = {
					minetest.get_item_group(minetest.get_node(p[1]).name, 'rock_climbing_mechanics'),
					minetest.get_item_group(minetest.get_node(p[2]).name, 'rock_climbing_mechanics'),
					minetest.get_item_group(minetest.get_node(p[3]).name, 'rock_climbing_mechanics'),
					minetest.get_item_group(minetest.get_node(p[4]).name, 'rock_climbing_mechanics')
				}
				
				local del = not (
						(n[1] == 1 and not vector.equals(_pos, p[1])) or
						(n[2] == 1 and not vector.equals(_pos, p[2])) or
						(n[3] == 1 and not vector.equals(_pos, p[3])) or
						(n[4] == 1 and not vector.equals(_pos, p[4]))
				)
				minetest.set_node(pos, {name = del and 'air' or "default:CLIMBABLE_AIR"})
			end
		end
	end
	def.on_punch = function(pos, ...)
		for _, val in ipairs(check_these) do
			local pos = vector.add(val, pos)
			local node = minetest.get_node(pos)
			if node.name == "air" then
				minetest.set_node(pos, {name = "default:CLIMBABLE_AIR"})
			end
		end
		minetest.node_punch(pos, ...)
	end
	minetest.register_node(name, def)
end