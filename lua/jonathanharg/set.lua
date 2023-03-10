vim.opt.number = true
vim.opt.relativenumber = true

-- vim.opt.background = "dark"
-- vim.cmd.colorscheme("tokyonight")
vim.cmd.colorscheme("ayu-mirage")

vim.opt.spelllang = "en-gb"

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.smartindent = true

-- Enable mouse mode -> YUCK
vim.o.mouse = 'a'

-- Word Wrap
-- vim.opt.wrap = false

-- Default Fomat Options
-- vim.opt.formatlistpat = "jcroql"
-- No commenting on newline on enter see https://superuser.com/questions/271023/can-i-disable-continuation-of-comments-to-the-next-line-in-vim
-- TODO: This is broken
vim.opt.formatoptions = "jql"

vim.o.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience

vim.g.mapleader = " "

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- vim.opt.colorcolumn = "80"
