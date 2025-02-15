local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- local colors = one_dark_colors

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.default_prog = { "wsl.exe", "--cd", "~" }
end

config.font = wezterm.font({ family = "Roboto Mono", harfbuzz_features = { "calt=0", "clig=0", "liga=0" } })
config.font_size = 14
config.color_scheme = "Catppuccin Mocha"
config.use_dead_keys = false
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.enable_wayland = false

-- tmux keybinds
-- config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
-- config.keys = {
--     { key = "a", mods = "LEADER|CTRL", action = wezterm.action { SendString = "\x01" } },
--     { key = "-", mods = "LEADER",      action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
--     {
--         key = "|",
--         mods = "LEADER|SHIFT",
--         action = wezterm.action { SplitHorizontal = {
--             domain = "CurrentPaneDomain" } }
--     },
--     { key = "z", mods = "LEADER",       action = "TogglePaneZoomState" },
--     { key = "c", mods = "LEADER",       action = wezterm.action { SpawnTab = "CurrentPaneDomain" } },
--     { key = "h", mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Left" } },
--     { key = "j", mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Down" } },
--     { key = "k", mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Up" } },
--     { key = "l", mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Right" } },
--     { key = "H", mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Left", 5 } } },
--     { key = "J", mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Down", 5 } } },
--     { key = "K", mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Up", 5 } } },
--     { key = "L", mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Right", 5 } } },
--     { key = "1", mods = "LEADER",       action = wezterm.action { ActivateTab = 0 } },
--     { key = "2", mods = "LEADER",       action = wezterm.action { ActivateTab = 1 } },
--     { key = "3", mods = "LEADER",       action = wezterm.action { ActivateTab = 2 } },
--     { key = "4", mods = "LEADER",       action = wezterm.action { ActivateTab = 3 } },
--     { key = "5", mods = "LEADER",       action = wezterm.action { ActivateTab = 4 } },
--     { key = "6", mods = "LEADER",       action = wezterm.action { ActivateTab = 5 } },
--     { key = "7", mods = "LEADER",       action = wezterm.action { ActivateTab = 6 } },
--     { key = "8", mods = "LEADER",       action = wezterm.action { ActivateTab = 7 } },
--     { key = "9", mods = "LEADER",       action = wezterm.action { ActivateTab = 8 } },
--     { key = "&", mods = "LEADER|SHIFT", action = wezterm.action { CloseCurrentTab = { confirm = true } } },
--     { key = "x", mods = "LEADER",       action = wezterm.action { CloseCurrentPane = { confirm = true } } },
-- }

return config
