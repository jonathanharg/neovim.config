local git = require("neogit")
local ok, neogit = pcall(require, "neogit")
if not ok then
    return
end

neogit.setup {
    integrations = {
        diffview = true,
    },
}

vim.keymap.set("n", "<space>gd", ":DiffviewOpen ", { desc = '[G]it [D]iff' })
vim.keymap.set("n", "<space>gs", neogit.open, { desc = '[G]it [O]pen' })
vim.keymap.set("n", "<space>gc", function() neogit.open { "commit" } end, { desc = '[G]it [C]ommit' })
