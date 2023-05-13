local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = '[H]arpoon [A]dd' })
vim.keymap.set("n", "<leader>hh", ui.toggle_quick_menu, { desc = '[H]arpoon quick menu' })

-- vim.keymap.set("n", "<leader><tab>", function() ui.nav_next() end)
-- vim.keymap.set("n", "<leader><S-tab>", function() ui.nav_prev() end)
vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end, { desc = '[H]arpoon to file [1]' })
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end, { desc = '[H]arpoon to file [2]' })
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end, { desc = '[H]arpoon to file [3]' })
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end, { desc = '[H]arpoon to file [4]' })
