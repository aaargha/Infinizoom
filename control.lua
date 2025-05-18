require("defines")

local function change_zoom(event, factor)
	local player = game.players[event.player_index]
	
	player.zoom = player.zoom * factor
end

local function zoom_in(event)
	change_zoom(event, 10/9)
end

local function zoom_out(event)
	change_zoom(event, 9/10)
end

local function update_zoom_limits(player)
	local zoom_limits = player.zoom_limits
	zoom_limits.closest = { zoom = player.mod_settings[Infinizoom_defines.names.settings.closest_zoom].value }
	zoom_limits.furthest = { zoom = player.mod_settings[Infinizoom_defines.names.settings.furthest_zoom].value }
	zoom_limits.furthest_game_view = { zoom = player.mod_settings[Infinizoom_defines.names.settings.furthest_game_view].value }
	
	player.zoom_limits = zoom_limits
end

local function handle_controller_change(event)
	update_zoom_limits(game.players[event.player_index])
end

local function handle_mod_setting_change(event)
	for _, setting in pairs(Infinizoom_defines.names.settings) do
		if event.setting == setting then
			update_zoom_limits(game.players[event.player_index])
			return
		end
	end
end

local function fix_setup()
	for _, player in pairs(game.players) do
		update_zoom_limits(player)
	end
end

script.on_event(Infinizoom_defines.names.hotkeys.increase_zoom, zoom_in)
script.on_event(Infinizoom_defines.names.hotkeys.decrease_zoom, zoom_out)
script.on_event(defines.events.on_player_controller_changed, handle_controller_change)
script.on_event(defines.events.on_runtime_mod_setting_changed, handle_mod_setting_change)

script.on_init(fix_setup)
script.on_configuration_changed(fix_setup)
