return {
    {
        "ThePrimeagen/harpoon",
        config = function()
            local harpoon = require "harpoon"
            harpoon.setup {}

            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")

            vim.keymap.set("n", "<leader>ha", require("harpoon.mark").add_file,
                           {desc = '[H]arpoon [A]dd'})
            vim.keymap.set("n", "<leader>hh",
                           require("harpoon.ui").toggle_quick_menu,
                           {desc = '[H]arpoon quick menu'})

            for i = 1, 5 do
                vim.keymap.set("n", string.format("<space>%s", i), function()
                    require("harpoon.ui").nav_file(i)
                end, {desc = string.format("[H]arpoon to file [%s]", i)})
            end
        end
    }
}
