local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'rust_analyzer',
    'marksman',
    'lua_ls',
})

local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {
                    'vim',
                    'require'
                },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}

local cmp = require 'cmp'
local cmp_action = require('lsp-zero').cmp_action()

local luasnip = require 'luasnip'

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete {},
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
}

lsp.set_preferences({
    -- suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, remap = false, desc = desc })
    end

    nmap("<leader>rn", function() vim.lsp.buf.rename() end, "[R]e[n]ame")
    nmap('<leader>ca', function() vim.lsp.buf.code_action() end, "[C]ode [a]ctions")
    nmap('gd', function() vim.lsp.buf.definition() end, "[G]oto [d]efinition")
    nmap("gr", function() require('telescope.builtin').lsp_references() end, "[G]oto [r]eferences")
    nmap('gi', function() vim.lsp.buf.implementation() end, "[G]oto [i]mplementation")
    nmap('<leader>D', function() vim.lsp.buf.type_definition() end, 'Type [D]efinition')
    nmap('<leader>ds', function() require('telescope.builtin').lsp_document_symbols() end, '[D]ocument [S]ymbols')
    nmap('<leader>ws', function() require('telescope.builtin').lsp_dynamic_workspace_symbols() end,
        '[W]orkspace [S]ymbols')
    nmap('K', function() vim.lsp.buf.hover() end, "Hover documentation")
    nmap("<C-k>", function() vim.lsp.buf.signature_help() end, "Signature Documentation")
    nmap('gD', function() vim.lsp.buf.declaration() end, '[G]oto [D]eclaration')
    nmap('<leader>wa', function() vim.lsp.buf.add_workspace_folder() end, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', function() vim.lsp.buf.remove_workspace_folder() end, '[W]orkspace [R]emove Folder')
    nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})

-- Turn on lsp status information
require('fidget').setup()

vim.keymap.set("n", "]t", function()
    require("todo-comments").jump_next()
end, { desc = "Next TODO" })

vim.keymap.set("n", "[t", function()
    require("todo-comments").jump_prev()
end, { desc = "Previous TODO" })
