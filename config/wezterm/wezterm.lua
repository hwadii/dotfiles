local wezterm = require 'wezterm'
local mux = wezterm.mux
local config = {}

config.default_prog = { "/opt/homebrew/bin/fish", "-c", "tmux new-session -ADs x" }
config.font = wezterm.font 'BerkeleyMono Nerd Font'
config.font_size = 15
config.enable_tab_bar = false
config.use_ime = false
config.anti_alias_custom_block_glyphs = false
config.custom_block_glyphs = false
config.line_height = 1
config.enable_scroll_bar = false
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

config.keys = {
  {
    key = 'O',
    mods = 'CTRL',
    action = wezterm.action.QuickSelectArgs {
      label = 'open url',
      patterns = {
        'https?://\\S+',
      },
      action = wezterm.action_callback(function(window, pane)
        local url = window:get_selection_text_for_pane(pane)
        wezterm.log_info('opening: ' .. url)
        wezterm.open_with(url)
      end),
    },
  },
}

config.colors = {
  -- The default text color
  foreground = '#d1d1d1',
  -- The default background color
  background = '#1a1a19',

  -- Overrides the cell background color when the current cell is occupied by the
  -- cursor and the cursor style is set to Block
  cursor_bg = '#dbdbdb',
  -- Overrides the text color when the current cell is occupied by the cursor
  cursor_fg = '#1a1a19',

  -- the foreground color of selected text
  selection_fg = '#1a1a19',
  -- the background color of selected text
  selection_bg = '#fffacd',

  -- The color of the scrollbar "thumb"; the portion that represents the current viewport
  scrollbar_thumb = '#222222',

  -- The color of the split lines between panes
  split = '#444444',

  ansi = {
    "#1a1a19",
    "#ff968c",
    "#7bb099",
    "#ffc591",
    "#97B2C9",
    "#de9bc8",
    "#61957f",
    "#d1d1d1",
  },
  brights = {
    "#4c4c4b",
    "#ffafa5",
    "#94c9b2",
    "#ffdeaa",
    "#a6cded",
    "#f7b4e1",
    "#7aae98",
    "#eaeaea",
  },

  -- Since: 20220319-142410-0fcdea07
  -- When the IME, a dead key or a leader key are being processed and are effectively
  -- holding input pending the result of input composition, change the cursor
  -- to this color to give a visual cue about the compose state.
  compose_cursor = 'orange',

  -- Colors for copy_mode and quick_select
  -- available since: 20220807-113146-c2fee766
  -- In copy_mode, the color of the active text is:
  -- 1. copy_mode_active_highlight_* if additional text was selected using the mouse
  -- 2. selection_* otherwise
  copy_mode_active_highlight_bg = { Color = '#000000' },
  -- use `AnsiColor` to specify one of the ansi color palette values
  -- (index 0-15) using one of the names "Black", "Maroon", "Green",
  --  "Olive", "Navy", "Purple", "Teal", "Silver", "Grey", "Red", "Lime",
  -- "Yellow", "Blue", "Fuchsia", "Aqua" or "White".
  copy_mode_active_highlight_fg = { AnsiColor = 'Black' },
  copy_mode_inactive_highlight_bg = { Color = '#52ad70' },
  copy_mode_inactive_highlight_fg = { AnsiColor = 'White' },

  quick_select_label_bg = { Color = 'peru' },
  quick_select_label_fg = { Color = '#1a1a19' },
  quick_select_match_fg = { Color = '#ffffff' },
}

return config
