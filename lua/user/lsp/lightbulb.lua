require('nvim-lightbulb').setup({autocmd = {enabled = true}})
vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb({ ignore = {"null-ls"} })]]
