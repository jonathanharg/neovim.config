local tree = require("nvim-tree")

tree.setup({
    renderer = {
        highlight_git = true,
        icons = {
            show = {
                git = false,
            }
        }
    },
})

vim.keymap.set("n", "<leader>t", vim.cmd.NvimTreeToggle, { desc = 'Open tree'})

-- vim.g.nvim_tree_auto_open = 1
-- vim.g.nvim_tree_auto_close = 1
-- renderer.icons.show.git
-- rendere.highlight_git
