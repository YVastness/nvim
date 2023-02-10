-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
    sort_by = "name",
    select_prompts = true,
    view = {
        width = 30,
        -- on_attach = "enable",
        -- centralize_selection = true,
        -- hide_root_folder = true,
        preserve_window_proportions = true,
        mappings = {
            list = {
                { key = "P", action = "parent_node" },
                { key = "O", action = "preview" },
                { key = "ge", action = "prev_diag_item" },
                { key = "[[", action = "prev_git_item" },
                { key = "gE", action = "next_diag_item" },
                { key = "]]", action = "next_git_item" },
            },
        },
    },
    renderer = {
        group_empty = true,
        add_trailing = true,
        highlight_opened_files = "all",
        root_folder_label = function(path)
            return "\t" .. vim.fn.fnamemodify(path, ":t")
        end

    },
    diagnostics = {
        enable = true,
        show_on_dirs = false,
        show_on_open_dirs = true,
        debounce_delay = 50,
        severity = {
            min = vim.diagnostic.severity.HINT,
            max = vim.diagnostic.severity.ERROR,
        },
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    filters = {
        dotfiles = true,
    },
    modified = {
        enable = false,
        show_on_dirs = true,
        show_on_open_dirs = true,
    },
    actions = {
        open_file = {
            quit_on_open = false,
            resize_window = true,
            window_picker = {
                enable = true,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                    buftype = { "nofile", "terminal", "help" },
                },
            },
        },
    },
})
