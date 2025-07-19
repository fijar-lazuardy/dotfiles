return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		lsp = {
			hover = {
				enabled = false, -- 👈 turn off Noice hover so native one with border works
			},
			signature = {
				enabled = false,
			},
		},
		-- add any options here
		messages = {
			-- NOTE: If you enable messages, then the cmdline is enabled automatically.
			-- This is a current Neovim limitation.
			enabled = false, -- enables the Noice messages UI
			view = "notify", -- default view for messages
			view_error = false, -- view for errors
			view_warn = "notify", -- view for warnings
			view_history = "messages", -- view for :messages
			view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
		},
	},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
	},
}
