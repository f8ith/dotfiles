local wezterm = require 'wezterm';

local ayu_colors = {
  bg = "#e7e8e9",
  bg2 = "#fafafa",
  fg = "#575f66"
}

local palenight_colors = {
  bg = "#292d3e",
  bg2 = "#3e4452",
  fg = "#cccccc"
}

local one_dark_colors = {
  bg = "#21252b",
  bg2 = "#282C34",
  fg = "#ABB2BF",
  accent = "#C678DD"
}

local colors = one_dark_colors

return {
  leader = { key="a", mods="CTRL", timeout_milliseconds=1000 },
  font = wezterm.font("SFMono Nerd Font"),
  font_size = 14,
  color_scheme = "OneHalfDark",
  use_dead_keys = false,
  tab_bar_at_bottom = true,
  keys = {
    { key = "a", mods = "LEADER|CTRL",  action=wezterm.action{SendString="\x01"}},
    { key = "-", mods = "LEADER",       action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
    { key = "|", mods = "LEADER|SHIFT", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
    { key = "z", mods = "LEADER",       action="TogglePaneZoomState" },
    { key = "c", mods = "LEADER",       action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
    { key = "h", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Left"}},
    { key = "j", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Down"}},
    { key = "k", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Up"}},
    { key = "l", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Right"}},
    { key = "H", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Left", 5}}},
    { key = "J", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Down", 5}}},
    { key = "K", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Up", 5}}},
    { key = "L", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Right", 5}}},
    { key = "1", mods = "LEADER",       action=wezterm.action{ActivateTab=0}},
    { key = "2", mods = "LEADER",       action=wezterm.action{ActivateTab=1}},
    { key = "3", mods = "LEADER",       action=wezterm.action{ActivateTab=2}},
    { key = "4", mods = "LEADER",       action=wezterm.action{ActivateTab=3}},
    { key = "5", mods = "LEADER",       action=wezterm.action{ActivateTab=4}},
    { key = "6", mods = "LEADER",       action=wezterm.action{ActivateTab=5}},
    { key = "7", mods = "LEADER",       action=wezterm.action{ActivateTab=6}},
    { key = "8", mods = "LEADER",       action=wezterm.action{ActivateTab=7}},
    { key = "9", mods = "LEADER",       action=wezterm.action{ActivateTab=8}},
    { key = "&", mods = "LEADER|SHIFT", action=wezterm.action{CloseCurrentTab={confirm=true}}},
    { key = "x", mods = "LEADER",       action=wezterm.action{CloseCurrentPane={confirm=true}}},
  },
  colors = {
   tab_bar = {

     -- The color of the strip that goes along the top of the window
     background = colors.bg,

     -- The active tab is the one that has focus in the window
     active_tab = {
       -- The color of the background area for the tab
       bg_color = colors.bg2,
       -- The color of the text for the tab
       fg_color = colors.accent,

       -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
       -- label shown for this tab.
       -- The default is "Normal"
       intensity = "Normal",

       -- Specify whether you want "None", "Single" or "Double" underline for
       -- label shown for this tab.
       -- The default is "None"
       underline = "None",

       -- Specify whether you want the text to be italic (true) or not (false)
       -- for this tab.  The default is false.
       italic = false,

       -- Specify whether you want the text to be rendered with strikethrough (true)
       -- or not for this tab.  The default is false.
       strikethrough = false,
     },

     -- Inactive tabs are the tabs that do not have focus
     inactive_tab = {
       bg_color = colors.bg,
       fg_color = colors.fg,

       -- The same options that were listed under the `active_tab` section above
       -- can also be used for `inactive_tab`.
     },
   }
  },
}
