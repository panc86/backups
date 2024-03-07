-- setup plugin manager
require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "ruff_lsp", "pyright" },
}
-- init config instance
local lspconfig = require('lspconfig')

-- auto-completion capabilities
--local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- setup language servers
lspconfig.pyright.setup {}
lspconfig.ruff_lsp.setup {}

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        -- Buffer local mappings
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<C-h>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>vws', vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, opts)
        -- diagnostic
        vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_next, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, opts)
    end,
})
