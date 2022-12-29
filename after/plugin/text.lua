local pair = require("nvim-autopairs")
local comment = require("Comment")
local todo = require("todo-comments")
local surround = require("nvim-surround")
local indent = require("indent_blankline")

pair.setup()
comment.setup()
todo.setup()
surround.setup()
indent.setup()

--     Old text                    Command         New text
-- --------------------------------------------------------------------------------
--     surr*ound_words             ysiw)           (surround_words)
--     *make strings               ys$"            "make strings"
--     [delete ar*ound me!]        ds]             delete around me!
--     remove <b>HTML t*ags</b>    dst             remove HTML tags
--     'change quot*es'            cs'"            "change quotes"
--     <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
--     delete(functi*on calls)     dsf             function calls
