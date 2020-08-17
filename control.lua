if zoom == nil then
	zoom = {}
end

function change_zoom(event, factor, render_mode)
	local p_idx = event.player_index
	
	if render_mode == defines.render_mode.chart then
		return
	end
	
	if zoom[p_idx] == nil then
		zoom[p_idx] = {}
	end
	
	if zoom[p_idx][render_mode] == nil then
		zoom[p_idx][render_mode] = 1
	end
	
	local new_zoom = zoom[p_idx][render_mode] * factor
	
	-- turns out there is a limit for how much you can zoom out without "breaking" the engine :(
	if new_zoom < 0.034336838202925 or new_zoom > 1061298.2223154 then
		return
	end
	
	zoom[p_idx][render_mode] = new_zoom
	game.players[p_idx].zoom = zoom[p_idx][render_mode]
end

function zoom_in(event)
	change_zoom(event, 10/9, game.players[event.player_index].render_mode)
end

function zoom_out(event)
	change_zoom(event, 9/10, game.players[event.player_index].render_mode)
end

-- only sets the mods internal zoom factor
function set_zoom(event, zoom_level, render_mode)
	local p_idx = event.player_index
	
	if zoom[p_idx] == nil then
		zoom[p_idx] = {}
	end
	
	zoom[p_idx][render_mode] = zoom_level
end

function reset_zoom(event)
	set_zoom(event, 1, game.players[event.player_index].render_mode)
end

function reset_zoom_2x(event)
	set_zoom(event, 2, game.players[event.player_index].render_mode)
end

function toggle_map(event)
	-- to make the transition from map to zoom to world look good
	set_zoom(event, 24/64, defines.render_mode.chart_zoomed_in)
end

script.on_event("infinizoom_increase_zoom", zoom_in)
script.on_event("infinizoom_decrease_zoom", zoom_out)
script.on_event("infinizoom_reset_zoom", reset_zoom)
script.on_event("infinizoom_reset_2x_zoom", reset_zoom_2x)
script.on_event("infinizoom_toggle_map", toggle_map)
