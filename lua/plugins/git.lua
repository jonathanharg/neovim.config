return {
    {
        'NeogitOrg/neogit',
        dependencies = {'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim'},
        opts = {integrations = {diffview = true}},
        keys = {
            {"<space>gd", ":DiffviewOpen ", desc = '[G]it [D]iff'},
            {
                "<space>gs",
                function() require("neogit").open() end,
                desc = '[G]it [O]pen'
            }, {
                "<space>gc",
                function() require("neogit").open({"commit"}) end,
                desc = '[G]it [C]ommit'
            }
        }
    }, {'sindrets/diffview.nvim', dependencies = 'nvim-tree/nvim-web-devicons'},
    {
        -- Adds git releated signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        opts = {
            on_attach = function(bufnr)
                vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk,
                               {
                    buffer = bufnr,
                    desc = '[G]o to [P]revious Hunk'
                })
                vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk,
                               {buffer = bufnr, desc = '[G]o to [N]ext Hunk'})
                vim.keymap.set('n', '<leader>ph',
                               require('gitsigns').preview_hunk,
                               {buffer = bufnr, desc = '[P]review [H]unk'})
            end
        }
    },
    {
        'ruifm/gitlinker.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        config = {}
    }
}

