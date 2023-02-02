local vim = vim
-- require("mason").setup({
--     ui = {
--         icons = {
--             -- package_installed = "✓",
--             -- package_pending = "➜",
--             -- package_uninstalled = "✗"
--         }
--     }
-- })
--
-- require("mason-lspconfig").setup({
--     -- 确保安装，根据需要填写
--     ensure_installed = {
--         "sumneko_lua", 'quick_lint_js', 'pyright', 'tsserver', 'vimls',
--     },
-- })



-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>to', vim.diagnostic.open_float, opts)
vim.keymap.set('n', 'gE', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', 'ge', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>tp', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<space>ww', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-t>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<A-CR>', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<space>re', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>fa', function() vim.lsp.buf.format { async = true } end, bufopts)
end


local lsp_flags = {
    -- This is the default in Nvim 0.7+
    -- debounce_text_changes = 150,
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

local servers = { 'sumneko_lua', 'quick_lint_js', 'pyright', 'tsserver', 'vimls', }



for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        capabilities = capabilities,
        on_attach = on_attach,
        flags = lsp_flags,
    }
end
-- vim.cmd([[ autocmd CursorHold,CursorHoldI * lua require('code-actions').code_action_listener()]])
