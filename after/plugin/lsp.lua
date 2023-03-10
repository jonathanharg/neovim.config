local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'rust_analyzer',
    'marksman',
})

lsp.configure('lua-language-server', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
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

-- local null_ls = require('null-ls')
-- local null_opts = lsp.build_options('null-ls', {})
--
-- null_ls.setup({
--     on_attach = function(client, bufnr)
--         null_opts.on_attach(client, bufnr)
--     end,
--     sources = {
--         null_ls.builtins.formatting.prettier,
--         null_ls.builtins.diagnostics.cspell,
--         null_ls.builtins.code_actions.cspell,
--     }
-- })
--
-- require('mason-null-ls').setup({
--     ensure_installed = nil,
--     automatic_installation = true,
--     automatic_setup = true,
-- })

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
