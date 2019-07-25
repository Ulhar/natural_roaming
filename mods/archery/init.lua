--archery = {}

minetest.register_tool("archery:wooden_bow", {
	description = "Wooden Bow",
	inventory_image = "archery_wooden-bow.png",
	on_use = --[[function(itemstack, user, pointedthing)
		return ]]minetest.item_eat(0, "archery:ready_wooden_bow")--[[
	end,]]
})

minetest.register_tool("archery:ready_wooden_bow", {
	description = "Wooden Bow (readied)",
	inventory_image = "archery_ready-wooden-bow.png",
	on_use = --[[function(itemstack, user, pointedthing)
		return ]]minetest.item_eat(0, "archery:wooden_bow")--[[
	end,]]
})
