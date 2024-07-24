return {
    "cbochs/grapple.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    },
    opts = {
        scope = "git", -- also try out "git_branch"
        icons = true, -- setting to "true" requires "nvim-web-devicons"
        status = false,
    },
    keys = {
        { "<leader>a", "<cmd>Grapple tag<cr>", desc = "Tag a file" },
        { "<c-e>", "<cmd>Grapple toggle_tags<cr>", desc = "Toggle tags menu" },

        { "<c-s-n>", "<cmd>Grapple cycle_tags next<cr>", desc = "Go to next tag" },
        { "<c-s-p>", "<cmd>Grapple cycle_tags prev<cr>", desc = "Go to previous tag" },
    },
}
