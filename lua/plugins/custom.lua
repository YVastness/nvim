vim.api.nvim_command('au TextYankPost * silent! lua vim.highlight.on_yank{hi0roup="IncSearch", timeout=300}')
