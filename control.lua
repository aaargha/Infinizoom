if zoom == nil then
	zoom = {}
end


local function zoom_in(event)
	local p_idx = event.player_index
	if zoom[p_idx] == nil then
		zoom[p_idx] = 1
	end
	zoom[p_idx]  = zoom[p_idx] * 1.1
	game.players[p_idx].zoom = zoom[p_idx]
end

local function zoom_out(event)
	local p_idx = event.player_index
	if zoom[p_idx] == nil then
		zoom[p_idx] = 1
	end
	zoom[p_idx]  = zoom[p_idx] * 0.9
	game.players[p_idx].zoom = zoom[p_idx]
end

local function zoom_reset(event)
	local p_idx = event.player_index
	zoom[p_idx] = 1
	game.players[p_idx].zoom = zoom[p_idx]
end

script.on_event("infinizoom_increase_zoom", zoom_in)
script.on_event("infinizoom_decrease_zoom", zoom_out)
script.on_event("infinizoom_reset_zoom", zoom_reset)
