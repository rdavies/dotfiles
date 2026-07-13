-- WezTerm config — EXPLORATORY, trying it alongside Alacritty (which stays
-- as the primary config for now, see .config/alacritty/alacritty.toml).
-- Lives here rather than ~/.wezterm.lua: WezTerm checks
-- $XDG_CONFIG_HOME/wezterm/wezterm.lua (= ~/.config/wezterm/wezterm.lua
-- given fish's XDG_CONFIG_HOME) before falling back to the home-dir file.

local wezterm = require('wezterm')
local config = wezterm.config_builder()

-- macOS launches WezTerm as a GUI app (Finder/Dock), so it inherits a bare
-- system PATH ("/usr/bin:/bin:/usr/sbin:/sbin") instead of a shell's PATH -
-- Homebrew's bin dir is missing, so a bare "fish" can't be found without
-- this. Mirrors the same brew-prefix check config.fish already uses.
local function homebrew_bin_dir()
  for _, dir in ipairs({ '/opt/homebrew/bin', '/home/linuxbrew/.linuxbrew/bin' }) do
    local f = io.open(dir .. '/brew')
    if f then
      f:close()
      return dir
    end
  end
end

local brew_bin = homebrew_bin_dir()
if brew_bin then
  config.set_environment_variables = { PATH = brew_bin .. ':' .. os.getenv('PATH') }
end

-- shell: resolved via $PATH, same reasoning as alacritty.toml's
-- terminal.shell.program (portable across Apple Silicon/Intel/Linux)
config.default_prog = { 'fish' }

-- catppuccin mocha, matching Alacritty/tmux/Neovim. Built into WezTerm's
-- color scheme registry - no external theme repo to clone, unlike Alacritty.
config.color_scheme = 'Catppuccin Mocha'

-- font: mirrors alacritty.toml's SFMono Nerd Font setup. WezTerm's weight
-- enum has no exact "Semibold" - DemiBold (600) is the standard equivalent.
config.font_size = 16.0
config.font = wezterm.font('SFMono Nerd Font', { weight = 'Light' })
config.font_rules = {
  { intensity = 'Bold', font = wezterm.font('SFMono Nerd Font', { weight = 'DemiBold' }) },
  { italic = true, font = wezterm.font('SFMono Nerd Font', { weight = 'Light', italic = true }) },
}

-- window: no title bar/buttons (alacritty's "buttonless"), opacity, padding,
-- and starting size to match alacritty.toml
config.window_decorations = 'RESIZE'
config.window_background_opacity = 0.95
config.window_padding = { left = 18, right = 18, top = 16, bottom = 16 }
config.initial_cols = 135
config.initial_rows = 40

-- native macOS vibrancy/translucency to go with the opacity above
config.macos_window_background_blur = 20

-- no tab bar: tmux (already auto-attached by fish) is the multiplexer here,
-- so WezTerm's own tabs would just be redundant chrome
config.enable_tab_bar = false

-- real macOS Spaces fullscreen instead of WezTerm's own borderless toggle
config.native_macos_fullscreen_mode = true

-- keep window geometry stable when changing font size instead of resizing
config.adjust_window_size_when_changing_font_size = false

-- brew (not WezTerm's own GitHub-polling updater) is how this gets updated
config.check_for_updates = false

-- tmux is the actual session-persistence layer, not this window
config.window_close_confirmation = 'NeverPrompt'

-- treat both Option keys as plain Alt (not accent/compose), matching
-- alacritty.toml's option_as_alt = "Both"
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

-- re-read this file on save, same intent as alacritty's live_config_reload
config.automatically_reload_config = true

-- shift+enter sends ESC+CR, matching alacritty.toml's keyboard.bindings
-- entry (lets apps like Neovim distinguish shift+enter from plain enter)
config.keys = {
  { key = 'Enter', mods = 'SHIFT', action = wezterm.action.SendString('\x1b\r') },
}

return config
