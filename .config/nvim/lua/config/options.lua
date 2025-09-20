-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- nvim-cmp transparent background
vim.opt.pumblend = 0
vim.opt.winblend = 0

vim.g.ai_cmp = false -- Disable ai suggestions
vim.g.snacks_animate = false -- Disabling all animations

vim.opt.termbidi = true --- Enable bidirectional language support

vim.opt.termguicolors = true -- Showing all the available colors

vim.opt.swapfile = false -- Disable swap file
vim.opt.list = false -- Display invisible chars

vim.opt.listchars = {
  space = ".",
  eol = "↵",
  nbsp = "␣",
  trail = "·",
  precedes = "←",
  extends = "→",
  tab = "¬ ",
  conceal = "※",
}

-- Goneovim configuration
if vim.g.goneovim then
  vim.g.goneovim_font_fallback = { "Symbols Nerd Font Mono", "Vazirmatn", "Tahoma", "Arial" }
end

-- Neovide configuration
if vim.g.neovide then
  vim.g.neovide_theme = "auto"
  vim.g.neovide_opacity = 0.9
  vim.g.neovide_normal_opacity = 0.9
  vim.g.neovide_window_floating_opacity = 0.9
  vim.g.neovide_floating_blur = 0.7
  vim.g.neovide_window_blurred = true
  vim.g.neovide_floating_corner_radius = 1.0
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  vim.g.neovide_floating_shadow = true
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 5
  vim.g.neovide_show_border = false
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_animate_command_line = true
  vim.g.neovide_no_idle = true
  vim.g.neovide_confirm_quit = true
  vim.g.neovide_fullscreen = false
  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_padding_top = 10
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0

  -- Scaling at runtime
  vim.g.neovide_scale_factor = 1.0
  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end
  vim.keymap.set("n", "<C-=>", function()
    change_scale_factor(1.25)
  end)
  vim.keymap.set("n", "<C-->", function()
    change_scale_factor(1 / 1.25)
  end)
end
