return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local transparent_enabled = false

      local function apply_theme()
        require("tokyonight").setup({
          style = "moon",
          transparent = transparent_enabled,
          styles = {
            sidebars = transparent_enabled and "transparent" or "normal",
            floats = transparent_enabled and "transparent" or "normal",
          },
        })
        vim.cmd([[colorscheme tokyonight]])
      end

      apply_theme()

      vim.keymap.set("n", "<leader>ut", function()
        transparent_enabled = not transparent_enabled
        apply_theme()
      end, { desc = "Toggle Transparent Background" })
    end,
  },
}
