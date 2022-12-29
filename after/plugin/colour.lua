-- vim.cmd("colorscheme gruvbox")
function setGlobalColorScheme(name)
    if (name == "gruvbox") then
        vim.opt.background = "dark"
        require("gruvbox").setup()
        vim.cmd.colorscheme(name)
        require('lualine').setup {
            options = { theme = "gruvbox" },
        }
    elseif (name == "tokyonight") then
        vim.g.tokyonight_transparent_sidebar = true
        vim.g.tokyonight_transparent = true
        vim.opt.background = "dark"
        vim.cmd.colorscheme("tokyonight")
        require('lualine').setup {
            options = { theme = "tokyonight" },
        }
    elseif (name == "poimandres") then
        require('poimandres').setup {}
        vim.cmd.colorscheme('poimandres')
        require('lualine').setup {
            options = { theme = "poimandres" },
        }
    end
end

setGlobalColorScheme("poimandres")
