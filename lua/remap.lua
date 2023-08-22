-- Move selected lines up and down in visual mode with J & K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Move line up' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Move line down' })

-- Keeps cursor in place for J
vim.keymap.set("n", "J", "mzJ`z", { desc = 'Join two lines' })
-- Keeps cursor in place for page up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = 'Scroll down' })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = 'Scroll up' })
-- Keeps cursor in the middle for searching
vim.keymap.set("n", "n", "nzzzv", { desc = 'Next match' })
vim.keymap.set("n", "N", "Nzzzv", { desc = 'Previous match' })

-- greatest remap ever - delete and paste without modifying buffer
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = 'Delete and paste' })

-- next greatest remap ever : asbjornHaland
-- copy to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = 'Yank to system clipboard' })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = 'Yank line to system clipboard' })

-- delete to void registers
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = 'Delete to void register' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = 'Up' })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = 'Down' })


vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = 'Up quickfix' })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = 'Down quickfix' })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = 'Replace selection in file' })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = 'Make current file executable' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'View diagnostic' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'View all diagnostics' })
