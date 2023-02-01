-- https://github.com/lukas-reineke/indent-blankline.nvim
--
-- vim.opt.list = true
-- vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    show_current_context = true,        -- 高亮线
    show_current_context_start = false, -- 在缩进开始行下显示线
    -- show_end_of_line = true,
}
