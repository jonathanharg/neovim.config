-- require('lualine').setup {
--   options = {
--     -- icons_enabled = false,
--     -- theme = 'tokyonight',
--     -- theme = 'gruvbox',
--     -- component_separators = '|',
--     -- section_separators = '',
--   },
-- }
require('lualine').setup {
    extensions = {
        'fugitive', 'fzf', 'nvim-tree'
    }
}
