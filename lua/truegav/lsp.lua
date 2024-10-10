
require('mason').setup()
require('mason-lspconfig').setup()

local cmp = require('cmp')
local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')

vim.fn.sign_define("DiagnosticSignError", {text = "", numhl = "DiagnosticError"})
vim.fn.sign_define("DiagnosticSignWarn", {text = "", numhl = "DiagnosticWarn"})
vim.fn.sign_define("DiagnosticSignInfo", {text = "", numhl = "DiagnosticInfo"})
vim.fn.sign_define("DiagnosticSignHint", {text = "", numhl = "DiagnosticHint"})
-- Set up LSP diagnostics to show only errors
vim.diagnostic.config({
    virtual_text = {
        severity = { min = vim.diagnostic.severity.ERROR }, 
        only_current_line = true,  
    },
    signs = true,
    severity_sort = true,
    update_in_insert = true,
    underline = false,
})
-- Set up lspconfig with capabilities for nvim-cmp
require('mason-lspconfig').setup_handlers({
    function(server_name)
        lspconfig[server_name].setup {
            capabilities = cmp_nvim_lsp.default_capabilities(),
        }
    end
})

icons = {
            Text = "󰉿",
            Method = "󰆧",
            Function = "󰊕",
            Constructor = "",
            Field = "󰜢",
            Variable = "󰀫",
            Class = "󰠱",
            Interface = "",
            Module = "",
            Property = "󰜢",
            Unit = "󰑭",
            Value = "󰎠",
            Enum = "",
            Keyword = "󰌋",
            Snippet = "",
            Color = "󰏘",
            File = "󰈙",
            Reference = "󰈇",
            Folder = "󰉋",
            EnumMember = "",
            Constant = "󰏿",
            Struct = "󰙅",
            Event = "",
            Operator = "󰆕",
            TypeParameter = "",
        }

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    }),
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    sources = {
        { name = 'buffer' },
        { name = 'nvim_lsp' },
    },
    formatting = {
        format = function(_, vim_item)
            vim_item.kind = (icons[vim_item.kind] or "") .. " " .. vim_item.kind
            return vim_item
        end,
    },
})
