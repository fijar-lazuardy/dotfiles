return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    { "<leader>tdt", "<cmd> TodoTelescope <CR>", desc = "[T]o[d]o [T]elescope" },
  },
}
