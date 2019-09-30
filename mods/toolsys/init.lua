toolsys = {modpath = minetest.get_modpath("toolsys")}
local function dofile(filename) -- this way I only need to write the relative path
	_G.dofile(toolsys.modpath .. '/' .. filename)
end

local ts = toolsys

local function round(val)
	local func = (val % 1 < 0.5) and math.floor or math.ceil
	return func(val)
end

-- I imagine this will help
local tooltip = default.tooltip

ts.registered_toolheads = {}
ts.registered_handles = {}

-- I misused this function later, this is how I'm fixing it
local function get_definition(name)
	return minetest.registered_items[name]
end

local function makeCombo(handle, head)
	local Handle, Head = handle.name:split(':'), head.name:split(':')
	
	local tc = table.copy(head.tool_capabilities)
	for key, val in pairs(tc.groupcaps) do
		val.uses = round((val.uses + handle.uses) / 2)
	end
	
	local groups = {not_in_creative_inventory = 1}
	for key, val in pairs(handle.groups or {}) do
		groups[key] = val
	end
	for key, val in pairs(head.groups or {}) do
		groups[key] = val
	end
	
	local Name = "toolsys:" .. Handle[2] .. "_FROM_" .. Handle[1] .. "_PLUS_" .. Head[2] .. "_FROM_" .. Head[1]
	
	minetest.register_tool(Name, {
		tool_capabilities = tc,
		description = get_definition(handle.name).description .. " + " .. get_definition(head.name).description,
		inventory_image = "(" .. get_definition(handle.name).inventory_image .. ")^(" .. get_definition(head.name).inventory_image .. ")",
		groups = groups,
		on_use = head.on_use
	})
	
	-- It's reccomended to bind the head to the handle, preferably using rope or paracord
	minetest.register_craft({
		output = Name,
		recipe = {{"group:rope"}, {head.name}, {handle.name}}
	})
	minetest.register_craft({
		output = Name .. " 1 4096",
		recipe = {{"group:string"}, {head.name}, {handle.name}}
	})
	minetest.register_craft({
		output = Name .. " 1 8192",
		recipe = {{head.name}, {handle.name}}
	})
end

-- [ ts.register_handle(name, def) ]
-- Register an item as a handle
-- [name] The name of the item to register as a handle.
-- [def] Handle definition. Defines uses and some groups (note that toolhead groups have priority)
function ts.register_handle(name, def)
	def.name = name
	ts.registered_handles[name] = def
	local handle = def
	for _, head in pairs(ts.registered_toolheads) do
		makeCombo(handle, head)
	end
end

-- [ ts.register_toolhead(name, def) ]
-- Register an item as a toolhead
-- [name] The name of the item to register as a toolhead.
-- [def] Handle definition. Defines tool_capabilities and groups. on_use can also be defined if you so wish.
function ts.register_toolhead(name, def)
	def.name = name
	ts.registered_toolheads[name] = def
	local head = def
	for _, handle in pairs(ts.registered_handles) do
		makeCombo(handle, head)
	end
end

--creative.register_tab(  "ts_handles",   "Handles",   ts.registered_handles)
--creative.register_tab("ts_toolheads", "Toolheads", ts.registered_toolheads)

dofile('recipes.lua')
dofile('builtin_tools.lua')
dofile("docs.lua")
