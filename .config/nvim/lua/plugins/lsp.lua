return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false,
      },
      setup = {
        tsserver = function(_, opts)
          opts.inlay_hints = {
            enabled = false,
          }
        end,
      },
    },
  },
}
