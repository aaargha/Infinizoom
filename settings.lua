require("defines")
	
data:extend({
	{
		type = "double-setting",
		name = Infinizoom_defines.names.settings.closest_zoom,
		setting_type = "runtime-per-user",
		default_value = 20000,
		minimum_value = 0,
		per_user = true,
		order = "1"
	},
	{
		type = "double-setting",
		name = Infinizoom_defines.names.settings.furthest_zoom,
		setting_type = "runtime-per-user",
		default_value = 0.00001,
		minimum_value = 0,
		per_user = true,
		order = "2"
	},
	{
		type = "double-setting",
		name = Infinizoom_defines.names.settings.furthest_game_view,
		setting_type = "runtime-per-user",
		default_value = 0.4,
		minimum_value = 0,
		per_user = true,
		order = "3"
	}
})
