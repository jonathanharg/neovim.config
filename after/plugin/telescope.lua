local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup()
require("telescope").load_extension("fzf")

vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Search Git files' })              -- TODO: Rebind
vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = 'Find recently opened files' })
vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = 'Find existing buffers' }) --TODO: rebind?
vim.keymap.set('n', '<leader>/', function()
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        -- winblend = 10, -- transparency
        previewer = false,
    })
end, { desc = 'Fuzzy search current buffer' })

vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>ss', function() vim.cmd('Telescope') end, { desc = 'Open telescope' })
