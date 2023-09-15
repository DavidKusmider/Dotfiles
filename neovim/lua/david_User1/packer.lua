-- Auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- Automatically source and re-sync packer when you save `packer.lua`.
local packer_group = vim.api.nvim_create_augroup("packer", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	command = "source <afile> | PackerSync",
	group = packer_group,
	pattern = vim.fn.expand("packer.lua"),
})

local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
	return
end

local packer_util_ok, packer_util = pcall(require, "packer.util")
if not packer_util_ok then
	return
end

-- Plugins
packer.startup({
	function(use)
		-- Packer manager manage itself
		use("wbthomason/packer.nvim") -- nom du repot GitHub

		-- Colorscheme
		use("folke/tokyonight.nvim")
		-- use { 'catppuccin/nvim', as = 'catppuccin' }

		use {
			'nvim-tree/nvim-tree.lua',
			requires = {
				'nvim-tree/nvim-web-devicons', -- optional
			},
		}
		-- Status line
		use {
			'nvim-lualine/lualine.nvim',
			requires = { 'nvim-tree/nvim-web-devicons', opt = true }
		}
		-- Commentaries
		use('numToStr/Comment.nvim')

		-- Colors
		use('NvChad/nvim-colorizer.lua')

		-- nvim-treesitter => highlighting and indenting code
		use({
			"nvim-treesitter/nvim-treesitter",
			run = function()
				pcall(require("nvim-treesitter.install").update({ with_sync = true }))
				-- local ts_update = pcall(require("nvim-treesitter.install").update({ with_sync = true }))
				-- ts_update() -- make sure parsers are automatically updated whenever nvim-treesitter is installed/updated
			end,
		})
		-- Autoclose
		use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose and autorename html tag with treesitter
	end,
	config = {
		display = {
			open_fn = function()
				return packer_util.float({ border = "single" })
			end,
		},
	},
})

-- Synchroniser les plugins après l'enregistrement du fichier packer.lua
if packer_bootstrap then
	packer.sync()
end
