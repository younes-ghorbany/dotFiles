return {
  "sphamba/smear-cursor.nvim",
  -- disabled for now
  enabled = false,
  -- disable smear-cursor when using neovide
  cond = function()
    return not vim.g.neovide
  end,
  opts = {
    stiffness = 0.5,
    trailing_stiffness = 0.5,
    matrix_pixel_threshold = 0.5,
    legacy_computing_symbols_support = true,
  },
}
