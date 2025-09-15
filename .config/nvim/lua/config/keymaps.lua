-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Custom keymaps --

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Cmd+W For closing the Buffer
vim.keymap.set("n", "<D-w>", "<cmd>bd<cr>", { desc = "Close Buffer" })

-- Entering Normal mode With <jk>
keymap.set("i", "jk", "<Esc>")

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select All
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Resize window using <Alt> arrow keys
keymap.set("n", "<M-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
keymap.set("n", "<M-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
keymap.set("n", "<M-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
keymap.set("n", "<M-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Open teminal in new buffer
keymap.set("n", "<leader>tt", ":terminal<cr>", { desc = "Terminal (New Buffer)" })

-- Tmux Navigation
keymap.set("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "Window Right" })
keymap.set("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "Window Left" })
keymap.set("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "Window Up" })
keymap.set("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "Window Down" })

-- Moving in insert mode
keymap.set("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
keymap.set("i", "<C-e>", "<End>", { desc = "move end of line" })
keymap.set("i", "<C-h>", "<Left>", { desc = "move left" })
keymap.set("i", "<C-l>", "<Right>", { desc = "move right" })
keymap.set("i", "<C-j>", "<Down>", { desc = "move down" })
keymap.set("i", "<C-k>", "<Up>", { desc = "move up" })
