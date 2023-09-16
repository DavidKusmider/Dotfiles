-- ###########
-- # KEYMAPS #
-- ###########

local key = vim.keymap.set
local full_options = { noremap = true, silent = true }
local noremap = { noremap = true }

-- Set leader key as a space.
vim.g.mapleader = " "

-- #############
-- # NVIM-TREE #
-- #############

key("n", "<leader>a", ":NvimTreeToggle<CR>", full_options)
key("n", "<leader>fa", ":NvimTreeFindFile<CR>", full_options)
key("i", "<leader>jk", "<esc>")

-- Telescope
key("n", "<leader>ff", ":Telescope find_files<CR>", full_options)
key("n", "<leader>fg", ":Telescope live_grep<CR>", full_options)
key("n", "<leader>fb", ":Telescope buffers<CR>", full_options)
key("n", "<leader>fh", ":Telescope help_tags<CR>", full_options)

-- New Tab
key("n", "tt", ":tabnew<Cr>", full_options)
key("n", "ss", ":split<Return><C-W>w", full_options)
key("n", "sv", ":vsplit<Return><C-w>w", full_options)

-- Move Window
key("n", "<leader>h", "<C-w>h", full_options)
key("n", "<leader>k", "<C-w>k", full_options)
key("n", "<leader>j", "<C-w>j", full_options)
key("n", "<leader>l", "<C-w>l", full_options)
-- Move Tabs
key("n", "H", "gT", full_options)
key("n", "L", "gt", full_options)



