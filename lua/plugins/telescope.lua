return {}
-- return {
--     "nvim-telescope/telescope-file-browser.nvim",
--     "nvim-telescope/telescope-hop.nvim",
--     "nvim-telescope/telescope-ui-select.nvim",
--     { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
--     {
--         "AckslD/nvim-neoclip.lua",
--         config = function()
--             require("neoclip").setup()
--         end,
--     },
--     {
--         "nvim-telescope/telescope.nvim",
--         priority = 100,
--         branch = '0.1.x',
--         config = function()
--             require("telescope").setup({
--                 extensions = {
--                     fzy_native = {
--                         override_generic_sorter = true,
--                         override_file_sorter = true,
--                     }
--                 }
--             })
--             vim.keymap.set('n', '<C-p>', function() require("telescope.builtin").git_files() end,
--                 { desc = 'Search Git files' }) -- TODO: Rebind
--             vim.keymap.set('n', '<leader>?', function() require("telescope.builtin").oldfiles() end,
--                 { desc = 'Find recently opened files' })
--             vim.keymap.set('n', '<leader><space>', function() require("telescope.builtin").buffers() end,
--                 { desc = 'Find existing buffers' }) --TODO: rebind?
--             vim.keymap.set('n', '<leader>/',
--                 function()
--                     require("telescope.builtin").current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
--                         -- winblend = 10, -- transparency
--                         previewer = false,
--                     }))
--                 end, { desc = 'Fuzzy search current buffer' })
--
--             vim.keymap.set('n', '<leader>sf', function() require("telescope.builtin").find_files() end,
--                 { desc = '[S]earch [F]iles' })
--             vim.keymap.set('n', '<leader>sh', function() require("telescope.builtin").help_tags() end,
--                 { desc = '[S]earch [H]elp' })
--             vim.keymap.set('n', '<leader>sw', function() require("telescope.builtin").grep_string() end,
--                 { desc = '[S]earch current [W]ord' })
--             vim.keymap.set('n', '<leader>sg', function() require("telescope.builtin").live_grep() end,
--                 { desc = '[S]earch by [G]rep' })
--             vim.keymap.set('n', '<leader>sd', function() require("telescope.builtin").diagnostics() end,
--                 { desc = '[S]earch [D]iagnostics' })
--             vim.keymap.set('n', '<leader>ss', function() vim.cmd('Telescope') end, { desc = 'Open telescope' })
--             -- _ = require("telescope").load_extension "dap"
--             -- _ = require("telescope").load_extension "notify"
--             _ = require("telescope").load_extension "file_browser"
--             _ = require("telescope").load_extension "ui-select"
--             _ = require("telescope").load_extension "fzf"
--             _ = require("telescope").load_extension "neoclip"
--         end,
--         dev = true,
--         dependencies = {
--             "nvim-telescope/telescope-file-browser.nvim",
--             "nvim-telescope/telescope-hop.nvim",
--             "nvim-telescope/telescope-ui-select.nvim",
--         }
--     },
-- }
