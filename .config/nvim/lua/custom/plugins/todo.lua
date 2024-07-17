return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  -- TODO: Test
  lazy = false,
  opts = {
    colors = {
      error = { "#FF5555" },
      warning = { "#FFB86C" },
      info = {  "#FF79C6" },
      hint = {  "#50FA7B" },
      default = {  "#BD93F9" },
      test = {  "#F1FA8C" }
    },
  },
  keys = {
    { "<leader>tdt", "<cmd> TodoTelescope <CR>", desc = "[T]o[d]o [T]elescope" },
  },
}
