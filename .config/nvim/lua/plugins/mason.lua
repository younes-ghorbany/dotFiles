return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "tailwindcss-language-server",
        "typescript-language-server",
        "css-lsp",
        "html-lsp",
        "bash-language-server",
        "json-lsp",
        "lua-language-server",
        "shfmt",
        "stylua",
        "lemminx",
        "prettier",
        "eslint-lsp",
        "codelldb",
        "js-debug-adapter",
      })
      opts.ui = {
        border = "rounded",
      }
    end,
  },
}
