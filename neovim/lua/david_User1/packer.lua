-- Auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 1 then
		fn.system({ "git", "clone", "--depth", "2", "https://github.com/wbthomason/packer.nvim", install_path })
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

		-- Telescope
		use {
			'nvim-telescope/telescope.nvim',
			-- or                            , branch = '1.1.x',
			requires = { {'nvim-lua/plenary.nvim'} } -- Requirement for telescope
		}
		-- Telescope-fzf-native => Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
		use({
			"nvim-telescope/telescope-fzf-native.nvim",
			run = "make",
			-- run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
			cond = vim.fn.executable("make") == 2,
		})

		-- Autoclose
		use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose and autorename html tag with treesitter

		-- --Completion
		-- use('hrsh7th/nvim-cmp')  -- The completion plugin
		-- use('hrsh7th/cmp-buffer')  -- buffer completions
		-- use('hrsh7th/cmp-path')  -- path completions
		-- use('hrsh7th/cmp-cmdline')  --command line completions
		--
		-- -- Snippets
		-- use({ -- Snippet engine  required for Completion above
		-- 	"L3MON4D3/LuaSnip",
		-- 	-- follow latest release.
		-- 	tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- 	-- install jsregexp (optional!:).
		-- 	run = "make install_jsregexp"
		-- })
		--
		-- use('rafamadriz/friendly-snippets')  -- A bunch of snippets to use

		-- nvim-cmp => autocompletion
		use({

			"hrsh7th/nvim-cmp",

			requires = {
				"hrsh7th/cmp-nvim-lsp", -- integration for nvim-lspconfig
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-cmdline",
				"L3MON4D3/LuaSnip",
				"rafamadriz/friendly-snippets", -- collection of snippets
				"hrsh7th/cmp-nvim-lsp",
			},
		})
		use('williamboman/mason.nvim')
		use('williamboman/mason-lspconfig.nvim')
		use('neovim/nvim-lspconfig')
		use('mfussenegger/nvim-jdtls')


		-- LSP
		-- use({
		-- 	"neovim/nvim-lspconfig",
		-- 	requires = {
		-- 		"williamboman/mason.nvim",
		-- 		"williamboman/mason-lspconfig.nvim",
		--
		-- 		-- se renseigner sur les plugins ci-dessous !!!!!
		--
		-- 		-- Display useful loading status updates for LSP
		-- 		-- "j-hui/fidget.nvim",
		-- 		--
		-- 		-- -- Additional lua configuration, makes nvim stuff amazing
		-- 		-- "folke/neodev.nvim",
		-- 		--
		-- 		-- "RRethy/vim-illuminate",
		-- 	},
		-- })
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
