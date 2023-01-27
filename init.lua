require("plugins.plugins-setup")

require("core.options")
require("core.keymaps")

-- 插件
require("plugins.custom")
require("plugins.lualine")
require("plugins/nvim-tree")
require("plugins/treesitter")
require("plugins/lsp")
require("plugins/cmp")
require("plugins/comment")
require("plugins/autopairs")
require("plugins/bufferline")
require("plugins/gitsigns")
require("plugins/telescope")
-- vim.api.nvim_command('au TextYankPost * silent! lua vim.highlight.on_yank()')
