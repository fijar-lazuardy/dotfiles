return {
  "ray-x/go.nvim",
  dependencies = { -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    { "<leader>gie", "<cmd> GoIfErr <CR>",       desc = "Go If Error" },
    { "<leader>gaj", "<cmd> GoAddTag json <CR>", desc = "Go Add Tag `json`" },
    { "<leader>gad", "<cmd> GoAddTag db <CR>",   desc = "Go Add Tag `db`" },
    { "<leader>gfs", "<cmd> GoFillStruct <CR>",  desc = "Go Fill Struct" },
    { "<leader>gtc", "<cmd> GoTest -v <CR>",     desc = "Go Test -v" },
  },
  config = function()
    require("go").setup({
      tag_options = "",
      test_runner = 'go',
      run_in_floaterm = true,
      floaterm = {                -- position
        posititon = 'auto',       -- one of {`top`, `bottom`, `left`, `right`, `center`, `auto`}
        width = 0.45,             -- width of float window if not auto
        height = 0.98,            -- height of float window if not auto
        title_colors = 'dracula', -- default to nord, one of {'nord', 'tokyo', 'dracula', 'rainbow', 'solarized ', 'monokai'}
      },
    })
    local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        require('go.format').goimport()
      end,
      group = format_sync_grp,
    })
  end,
  event = { "CmdlineEnter" },
  ft = { "go", 'gomod' },
  build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
}
