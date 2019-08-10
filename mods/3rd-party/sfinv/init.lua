dofile(minetest.get_modpath("sfinv") .. "/api.lua")

sfinv.register_page("sfinv:crafting", {
	title = "Crafting",
	get = function(self, player, context)
		return sfinv.make_formspec(player, context, [[
			list[current_player;main;0,0;5,5;]
			container[6, 0]
				list[current_player;craft;0,0;3,3]
				image[1,3;1,1;gui_furnace_arrow_bg.png^[transform2]
				list[current_player;craftpreview;1,4;1,1]
			container_end[]
			
			list[current_player;armor;0,5.25;5,1;]
			list[current_player;coins;0,6.25;5,1;]
			
			list[current_player;gear;6.0,5.25;3,1;]
			list[current_player;gear;6.5,6.25;2,1;3]
		]], false, "size[10,7]")
	end
})
