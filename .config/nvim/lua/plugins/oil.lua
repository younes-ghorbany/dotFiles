return {
  "stevearc/oil.nvim",
  keys = {
    { "<leader>-", "<cmd>Oil --float<CR>", desc = "Explorer" },
  },
  opts = {
    view_options = {
      show_hidden = true,
    },
    float = {
      padding = 5,
    },
  },
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons", "echasnovski/mini.icons" },
}
