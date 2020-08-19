data:extend({
  {
    type = "custom-input",
    name = "infinizoom_increase_zoom",
    key_sequence = "CONTROL + K"
  },
  {
    type = "custom-input",
    name = "infinizoom_decrease_zoom",
    key_sequence = "CONTROL + L"
  },
  {
    type = "custom-input",
    name = "infinizoom_toggle_map",
    key_sequence = "",
    linked_game_control = "toggle-map",
    consuming = "none"
  },
  {
    type = "custom-input",
    name = "infinizoom_reset_zoom",
    key_sequence = "",
    linked_game_control = "debug-reset-zoom",
    consuming = "none"
  },
  {
    type = "custom-input",
    name = "infinizoom_reset_2x_zoom",
    key_sequence = "",
    linked_game_control = "debug-reset-zoom-2x",
    consuming = "none"
  }
})
