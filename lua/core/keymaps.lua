vim.g.mapleader = " "

local keymap = vim.keymap
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- ---------- 插入模式 ---------- ---
keymap.set("i", "jk", "<ESC>")
keymap.set("i", "jj", "<ESC>")
keymap.set("i", "<C-a>", "<HOME>")
keymap.set("i", "<C-e>", "<END>")

-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ---------- 正常模式 ---------- ---
-- 常规
keymap.set("n", "<leader>w", ":w<CR>")
keymap.set("n", "<leader>q", ":Bdelete<CR>")
keymap.set("n", "<leader>Q", ":wqa<CR>")
-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v") -- 水平新增窗口 
keymap.set("n", "<leader>sh", "<C-w>s") -- 垂直新增窗口

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "<C-v>", "")

-- ---------- 插件 ---------- ---
-- nvim-tree
keymap.set("n", "tt", ":NvimTreeFocus<CR>")
keymap.set("n", "tc", ":NvimTreeClose<CR>")
keymap.set("n", "tf", ":NvimTreeFindFile<CR>")
-- bufferline
keymap.set("n", "<C-j>", ":BufferLineCyclePrev<CR>", opt)
keymap.set("n", "<C-k>", ":BufferLineCycleNext<CR>", opt)
keymap.set("n", "gb", ":BufferLinePick<CR>", opt)
-- keymap.set("n", "<leader>q", ":BufferLinePickClose<CR>")
