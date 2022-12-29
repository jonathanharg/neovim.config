vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

local FugitiveGroup = vim.api.nvim_create_augroup("jonathanharg_Fugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
    group = FugitiveGroup,
    pattern = "*",
    callback = function()
        if vim.bo.ft ~= "fugitive" then
            return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        vim.keymap.set("n", "<leader>gp", function()
            vim.cmd.Git("push")
        end, { buffer = bufnr, remap = false, desc = '[G]it [p]ush' })

        -- rebase always
        vim.keymap.set("n", "<leader>gP", function()
            vim.cmd.Git({ 'pull', '--rebase' })
        end, { buffer = bufnr, remap = false, desc = '[G]it [P]ull'})

        -- NOTE: It allows me to easily set the branch i am pushing and any tracking
        -- needed if i did not set the branch up correctly
        vim.keymap.set("n", "<leader>gt", ":Git push -u origin ",{buffer = bufnr, remap = false, desc='Git push upstream'} );
    end,
})
