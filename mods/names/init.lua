-- show names if not sneaking
minetest.register_globalstep(function(dtime)
	for _, plr in ipairs(minetest.get_connected_players()) do
		plr:set_nametag_attributes({color = "white", text = plr:get_player_control().sneak and '' or plr:get_player_name()})
	end
end)

local join_messages = {
	"@ joined the game.",
	"A wild @ appears.",
	"[insert @]"
}

-- send join messages
function minetest.send_join_message(plr)
	if plr == "singleplayer" then return end
	
	local msg = join_messages[
		math.random(
			1,
			#join_messages
		)
	]:split(
		"@"
	)
	
	if #msg == 1 then
		table.insert(
			msg,
			1,
			''
		)
	end
	
	minetest.chat_send_all(
		table.concat(
			msg,
			minetest.colorize(
				"skyblue",
				plr
			)
		)
	)
end

-- send leave messages
function minetest.send_leave_message(plr, timed_out)
	minetest.chat_send_all(
		minetest.colorize(
			"skyblue",
			plr
		) .. " left the game" .. (timed_out and " (idle for too long)." or ".")
	)
end
