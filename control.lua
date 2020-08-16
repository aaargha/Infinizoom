if zoom == nil then
	zoom = {}
end


function zoom_in(event)
	local p_idx = event.player_index
	if game.players[p_idx].render_mode == defines.render_mode.game then
		if zoom[p_idx] == nil then
			zoom[p_idx] = 1
			return
		end
		zoom[p_idx]  = zoom[p_idx] * 1.1
		game.players[p_idx].zoom = zoom[p_idx]
	end
end

function zoom_out(event)
	local p_idx = event.player_index
	if game.players[p_idx].render_mode == defines.render_mode.game then
		if zoom[p_idx] == nil then
			zoom[p_idx] = 1
			return
		end
		zoom[p_idx]  = zoom[p_idx] * 0.9
		game.players[p_idx].zoom = zoom[p_idx]
	end
end

script.on_event("infinizoom_increase_zoom", zoom_in)
script.on_event("infinizoom_decrease_zoom", zoom_out)
