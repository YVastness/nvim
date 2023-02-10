local function diff_source()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
        return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed
        }
    end
end

local function window()
    return vim.api.nvim_win_get_number(0)
end

require('lualine').setup({
    options = {
        theme = 'tokyonight'
    },
    extensions = {'nvim-tree', 'toggleterm'},
    sections = {
        lualine_a = { window },
        lualine_b = {
            {'b:gitsigns_head', icon = ''},
            {'diff', source = diff_source},
            {
                "diagnostics",
                sources = { "nvim_diagnostic" },
                sections = { "error", "warn" },
                symbols = { error = " ", warn = " " },
                colored = true,
                update_in_insert = false,
                always_visible = false,
            },
        },
        lualine_c = {
            {
                'filename',
                file_status = true, -- Displays file status (readonly status, modified status)
                path = 1, -- 0: Just the filename
                -- 1: Relative path
                -- 2: Absolute path

                shorting_target = 40, -- Shortens path to leave 40 spaces in the window
                -- for other components. (terrible name, any suggestions?)
                symbols = {
                    modified = '[+]', -- Text to show when the file is modified.
                    readonly = '[-]', -- Text to show when the file is non-modifiable or readonly.
                    unnamed = '[No Name]', -- Text to show for unnamed buffers.
                },
            }
        }
    }
})
