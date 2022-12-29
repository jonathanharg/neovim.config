local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd.packadd("packer.nvim")
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    -- Colours
    use("ellisonleao/gruvbox.nvim")
    use("folke/tokyonight.nvim")
    use('olivercederborg/poimandres.nvim')

    -- Dependencies
    use("nvim-lua/plenary.nvim")

    -- Git
    use("tpope/vim-fugitive")
    use("lewis6991/gitsigns.nvim")

    -- Shortcut Helper
    use("folke/which-key.nvim")

    -- Search
    use("nvim-telescope/telescope.nvim")
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

    -- TODO: Copy from and paste to clipboard
    -- https://www.reddit.com/r/neovim/comments/3fricd/easiest_way_to_copy_from_neovim_to_system/

    -- Tabs
    -- TODO: Configure this with mappings
    use("akinsho/bufferline.nvim")

    -- Tab Switcher
    use("theprimeagen/harpoon")


    -- Undo Tree
    use("mbbill/undotree")

    -- Status Line
    use("nvim-lualine/lualine.nvim")

    -- Language Server
    use {
        "VonHeikemen/lsp-zero.nvim",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        }
    }
    use("j-hui/fidget.nvim") -- LSP Status indicator

    -- Text
    use("windwp/nvim-autopairs")
    use("numToStr/Comment.nvim")
    use("lukas-reineke/indent-blankline.nvim")
    use("folke/todo-comments.nvim")
    use("kylechui/nvim-surround")
    use("tpope/vim-sleuth")

    -- For NVim development
    use("folke/neodev.nvim")

    -- Treesitter
    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
    use({ 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' })
    use("nvim-treesitter/playground")
    use("romgrk/nvim-treesitter-context")

    -- File Explorer
    use({
        "nvim-tree/nvim-tree.lua",
        requires = {
            "nvim-tree/nvim-web-devicons", -- optional, for file icons
        },
        tag = "nightly" -- optional, updated every week. (see issue #1193)
    })

    -- LaTex
    -- use("lervag/vimtex")
end)
