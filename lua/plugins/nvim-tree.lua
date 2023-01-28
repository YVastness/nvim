-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
    sort_by = "name",
    view = {
        width = 30,
        mappings = {
            list = {
                { key = "P",                              action = "parent_node" },
                { key = "O",                              action = "preview" },
                { key = "ge",                             action = "prev_diag_item" },
                { key = "[[",                             action = "prev_git_item" },
                { key = "gE",                             action = "next_diag_item" },
                { key = "]]",                             action = "next_git_item" },
            },
        },
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})
