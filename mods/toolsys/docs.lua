local cat_name = "toolsys"

-- this can be used as a template
doc.add_category(cat_name, {
	name        = "Tool Crafting",
	description = "Learn the ins and outs of building tools",
	
	build_formspec = doc.entry_builders.text,
	
	sorting      = "nosort",
	sorting_data = nil,
	
	hide_entries_by_default = false
})

-- this can also be used as a template
doc.add_entry(cat_name, "part_construction", {
	name = "Building Tool Parts",
	hidden = false,
	data = [[
	To build a tool part, place the materials in the crafting grid.
	Recipes are probably what you'd expect, to some degree (e.g.
	two rods of the same type for a handle).
	]]
})

doc.add_entry(cat_name, "tool_construction", {
	name = "Building the Actual Tools",
	hidden = false,
	data = [[
	(If you haven't built any parts yet, maybe go do that...)
	
	So, you've made parts, and want to put them to use? Simple.
	Place the handle and head in your crafting grid, with the head
	being directly above the handle.
	
	(You'll notice that the tool isn't at full durability. It's
	possible to prevent this, and this will be covered in another
	entry.)
	]]
})

doc.add_entry(cat_name, "lashing", {
	name = "Lashing your Tools",
	hidden = true,
	data = [[
	Do you want the most out of your brother- er tools?
	If so, you should consider lashing your tools.
	(Note that this only works when you're building the tool -
	putting rope on a breaking tool won't help.)
	
	When building a tool, add a piece of rope above the head.
	(string works too, but is less effective)
	]]
})