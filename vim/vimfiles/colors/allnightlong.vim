" SPDX-FileCopyrightText: 2022 Mischback
" SPDX-License-Identifier: MIT
" SPDX-FileType: SOURCE

" Provide the actual colorscheme for vim.
"
" The actual code is based on various other colorschemes. The structure is
" based on https://github.com/joshdick/onedark.vim .


" Reset existing highlights
highlight clear
if exists("syntax_on")
    syntax reset
endif


" Activate vim's 256 color mode, independent of the acutal terminal in use
set t_Co=256

" Provide the actual name of the colorscheme
let g:colors_name="allnightlong"


" Initialize support for italics
"
" Support for italics is dependent on the terminal in use and the font in
" this terminal. Support for italics is deactivated by default, but the user
" may *opt-in* by setting this to ``1`` in his ``.vimrc``.
if !exists("g:allnightlong_terminal_italics")
    let g:allnightlong_terminal_italics = 0
endif


" Apply a style to a highlight group
"
" Code is taken from https://github.com/noahfrederick/vim-hemisu
function! s:h(group, style)
    execute "highlight" a:group
        \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
        \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
        \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
        \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
        \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
        \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction


" Fetch the colors
let s:colors = allnightlong#GetColors()

" Give the palette a semantic meaning
let s:work_1 = s:colors.work_green
let s:work_2 = s:colors.work_pink
let s:ui_bg = s:colors.grey_1
let s:ui_fg = s:colors.grey_10
let s:ui_fg_dark = s:colors.grey_3
let s:ui_fg_darker = s:colors.grey_2
let s:ui_fg_darkest = s:colors.grey_0
let s:ui_hover_bg = s:colors.grey_2
let s:ui_hover_fg = s:colors.red
let s:ui_invert_fg = s:colors.grey_1
let s:ui_invert_bg = s:colors.grey_10
let s:ui_attention_fg = s:ui_invert_fg
let s:ui_attention_bg = s:colors.yellow
let s:ui_attention_bg_cur = s:colors.red
let s:ui_cursor_bg = s:colors.yellow
let s:ui_cursor_fg = s:ui_invert_fg
let s:ui_error = s:colors.red " TODO: This is not red enough!

let s:ui_element_dir = s:colors.blue

let s:syn_comment = s:colors.grey_5
let s:syn_string = s:colors.green
let s:syn_constant = s:colors.work_green
let s:syn_number = s:colors.orange
let s:syn_statement = s:colors.work_green
let s:syn_identifier = s:colors.work_green
let s:syn_preproc = s:colors.work_green
let s:syn_function = s:colors.work_green
let s:syn_type = s:colors.work_green
let s:syn_keyword = s:colors.work_green
let s:syn_special = s:colors.work_green
let s:syn_error = s:colors.work_green

let s:syn_diff_add = s:colors.green
let s:syn_diff_change = s:colors.yellow
let s:syn_diff_delete = s:colors.red
let s:syn_diff_text = s:colors.orange


" Apply the colors to highlight groups

" The overall window
call s:h("Normal", { "fg": s:ui_fg, "bg": s:ui_bg })
call s:h("EndOfBuffer", { "fg": s:ui_fg_darker, "bg": s:ui_bg })

" e.g. '~' and '@' at the end of the window
" FIXME: Evaluate what other themes do with this!
call s:h("NonText", { "fg": s:work_2 })

" Line number
" This is the static default formatting. For the currently active line see
" ``CursorLine`` and ``CursorLineNr`` below.
" TODO: Personally I don't use relative line numbers, but it might be desirable
"       to apply different colors to ``LineNrAbove`` and ``LineNrBelow``.
call s:h("LineNr", { "fg": s:ui_fg_dark })
call s:h("LineNrAbove", { "fg": s:ui_fg_dark })
call s:h("LineNrBelow", { "fg": s:ui_fg_dark })

" Column for *signs*
" E.g. gitgutter uses this column.
" TODO: How to style the actual signs?
call s:h("SignColumn", { "fg": s:ui_fg_dark, "bg": s:ui_bg })

" Modify the currently active line and column of the cursor
" Must be activated in ``.vimrc`` with ``cursorline`` / ``cursorcolumn``
" TODO: Evaluate the fg of ``CursorLineNr`` when the actual gitgutter colors
"       are applied.
call s:h("CursorLine", { "bg": s:ui_hover_bg })
call s:h("CursorLineNr", { "fg": s:ui_hover_fg, "bg": s:ui_hover_bg })
call s:h("CursorLineSign", { "bg": s:ui_hover_bg })  " FIXME: not working?!
call s:h("CursorColumn", { "bg": s:ui_hover_bg })

" Styling the vertical split
call s:h("VertSplit", { "fg": s:ui_bg, "bg": s:ui_hover_bg })

" Color of directories in listings, e.g. NerdTree
call s:h("Directory", { "fg": s:ui_element_dir })

" Error messages, e.g. unknown commands
call s:h("ErrorMsg", { "fg": s:ui_invert_fg, "bg": s:ui_error })

" The character under the cursor
" FIXME: Doesn't seem to work, investigate!
call s:h("Cursor", { "fg": s:ui_cursor_fg, "bg": s:ui_cursor_bg })
call s:h("ICursor", { "fg": s:ui_cursor_fg, "bg": s:ui_cursor_bg })

" Highlight search results
" Must be activated in ``.vimrc`` with ``set hlsearch``.
call s:h("Search", { "fg": s:ui_attention_fg, "bg": s:ui_attention_bg })
call s:h("IncSearch", { "fg": s:ui_attention_fg, "bg": s:ui_attention_bg })
" FIXME: This does not seem to work!
call s:h("CurSearch", { "fg": s:ui_attention_fg, "bg": s:ui_attention_bg_cur })

" Rulers to indicate the line length
" TODO: Might be switched to a darker color, A contrast required
call s:h("ColorColumn", { "fg": s:ui_invert_fg, "bg": s:ui_attention_bg })

" Provide colors for Diffs
" TODO: These do really really pop! Should darker versions be provided?
call s:h("DiffAdd", { "fg": s:ui_invert_fg, "bg": s:syn_diff_add })
call s:h("DiffChange", { "fg": s:ui_invert_fg, "bg": s:syn_diff_change })
call s:h("DiffDelete", { "fg": s:ui_invert_fg, "bg": s:syn_diff_delete })
call s:h("DiffText", { "fg": s:ui_invert_fg, "bg": s:syn_diff_text })


" The default set of syntax-related colors

" Comments
" The following mappings point to ``Comment``
" - ``cComment`` from ``c.vim``
" - ``cCppOut`` from ``c.vim``
" - ``htmlComment`` from ``html.vim``
" - ``htmlCommentPart`` from ``html.vim``
" - ``htmlCssStyleComment`` from ``html.vim``
" - ``pythonComment`` from ``python.vim``
" - ``shellbang`` from ``typescriptcommon.vim``
" - ``typeScriptComment`` from ``typescriptcommon.vim``
" - ``typescriptLineComment`` from ``typescriptcommon.vim``
" - ``typescriptDocComment`` from ``typescriptcommon.vim``
" - ``vimComment`` from ``vim.vim``
" - ``vim9Comment`` from ``vim.vim``
call s:h("Comment", { "fg": s:syn_comment })

" Constants
" TODO: Still needs to be done!
" The following mappings point to ``Constant``
" - [OVERRIDDEN] ``String`` from ``syncolor.vim``
" - ``Character`` from ``syncolor.vim`` TODO: What points to character?
" - [OVERRIDDEN] ``Number`` from ``syncolor.vim``
" - ``Boolean`` from ``syncolor.vim`` TODO: What points to boolean?
" - ``cConstant`` from ``c.vim``
" - ``typescriptGlobal`` from ``typescriptcommon.vim``
call s:h("Constant", { "fg": s:syn_constant })

" Strings
" The following mappings point to ``String``
" - ``cString`` from ``c.vim``
" - ``htmlValue`` from ``html.vim``
" - ``htmlPreAttr`` from ``html.vim``
" - ``htmlString`` from ``html.vim``
" - ``htmlValue`` from ``html.vim``
" - ``pythonString`` from ``python.vim``
" - ``pythonRawString`` from ``python.vim``
" - ``pythonQuotes`` from ``python.vim``
" - ``typescriptString`` from ``typescriptcommon.vim``
" - ``typescriptStringLiteralType`` from ``typescriptcommon.vim``
" - ``typescriptTemplateLiteralType`` from ``typescriptcommong.vim``
" - ``typescriptStringMember`` from ``typescriptcommon.vim``
" - ``typescriptTemplate`` from ``typescriptcommon.vim``
" - ``typescriptEventString`` from ``typescriptcommon.vim``
" - ``typescriptDestructureString`` from ``typescriptcommon.vim``
" - ``typescriptRegexpString`` from ``typescriptcommon.vim``
" - ``typescriptStringProperty`` from ``typescriptcommon.vim``
" - ``vimString`` from ``vim.vim``
call s:h("String", { "fg": s:syn_string })

" Numbers
" The following mappings point to ``Number``
" - ``cNumber`` from ``c.vim``
" - ``cOctal`` from ``c.vim``
" - ``pythonNumber`` from ``python.vim`` (configurable?!)
" - ``typescriptNumber`` from ``typescriptcommon.vim``
" - ``Float`` from ``syncolor.vim``
call s:h("Number", { "fg": s:syn_number })
call s:h("Statement", { "fg": s:syn_statement })
call s:h("Identifier", { "fg": s:syn_identifier })
call s:h("PreProc", { "fg": s:syn_preproc })
call s:h("Function", { "fg": s:syn_function })
call s:h("Type", { "fg": s:syn_type })
call s:h("Keyword", { "fg": s:syn_keyword })
call s:h("Special", { "fg": s:syn_special })
call s:h("Error", { "fg": s:syn_error })


" ===== C-specific
" cFormat (format string components; points to cSpecial in ``c.vim``)


" ===== Python-specific
" pythonBuiltin (e.g. ``None``)
" pythonDecorator (this is the ``@``)
" pythonDecoratorName (the actual name)
" pythonExceptions (e.g. ``KeyError``


" ===== TypeScript-specific
" typescriptDocNotation (tags in docstrings, where the docstrings are comments, e.g. ``@param`` -> '@')
" typescriptDocTags (tags in docstrings, where the docstrings are comments, e.g. ``@param`` -> 'param)


" ===== VIM-specific
" vimSetEqual
