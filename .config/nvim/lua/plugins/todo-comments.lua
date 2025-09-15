return {
  {
    "folke/todo-comments.nvim",
    optional = true,
  -- stylua: ignore
  keys = {
    { "<leader>xt", function() Snacks.picker.todo_comments() end, desc = "Todo" },
    { "<leader>xT", function () Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end, desc = "Todo/Fix/Fixme" },
  },
  },
}
