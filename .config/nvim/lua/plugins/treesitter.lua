return {

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "cmake",
          "gitignore",
          "graphql",
          "http",
          "rust",
          "toml",
          "ron",
          "sql",
          "bash",
          "comment",
          "css",
          "html",
          "http",
          "javascript",
          "json",
          "lua",
          "luadoc",
          "query",
          "markdown",
          "regex",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",
        })
      end
    end,
  },
}
