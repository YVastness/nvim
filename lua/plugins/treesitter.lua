require'nvim-treesitter.configs'.setup {
    -- 添加不同语言
    ensure_installed = { "vim", "help", "bash", "c", "cpp", "javascript", "json", "lua", "vim", "python", "typescript", "tsx", "css", "rust", "markdown", "markdown_inline" }, -- one of "all" or a list of languages

    highlight = { enable = true },
    indent = { enable = true },

    -- 不同括号颜色区分
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
    -- 启用增量选择
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<CR>',
            node_incremental = '<CR>',
            node_decremental = '<BS>',
            scope_incremental = '<TAB>',
        }
    },
}
-- 开启 Folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- 默认不要折叠
vim.wo.foldenable = false
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.wo.foldlevel = 99
