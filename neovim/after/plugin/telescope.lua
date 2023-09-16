local ts_ok, telescope = pcall(require, "telescope")
if not ts_ok then
	return
end

local ts_action_ok, ts_actions = pcall(require, "telescope.actions")
if not ts_action_ok then
	return
end

telescope.setup({
	defaults = {
		prompt_prefix = "🔍 ",
		hidden = true,
		mappings = {
			n = {
				["<C-j>"] = ts_actions.move_selection_next,
				["<C-k>"] = ts_actions.move_selection_previous,
				["<C-d>"] = ts_actions.delete_buffer,
			},
			i = {
				["<C-j>"] = ts_actions.move_selection_next,
				["<C-k>"] = ts_actions.move_selection_previous,
				["<C-d>"] = ts_actions.delete_buffer,
				["<leader>j"] = { "<esc>", type = "command" }
			},
		},
	},
	extensions = {
		bookmarks = {
			selected_browser = "google-chrome",
			url_open_command = "open", -- Either provide a shell command to open the URL
			url_open_plugin = nil, -- Available: 'vim_external', 'open_browser'
			full_path = true,
			firefox_profile_name = nil,
			debug = false,
		},
	},
})

pcall(telescope.load_extension, "fzf")

-- UI
vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#CCCCCC" })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#CCCCCC" })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "#CCCCCC" })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "#CCCCCC" })

vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "#24283b" })
vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "#24283b" })
vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "#24283b" })

vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = "#ffffff" })
vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = "#ffffff" })
vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = "#ffffff" })
