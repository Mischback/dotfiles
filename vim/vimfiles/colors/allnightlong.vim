" SPDX-FileCopyrightText: 2022 Mischback
" SPDX-License-Identifier: MIT
" SPDX-FileType: SOURCE

" Provide the actual colorscheme for vim.
"
" The actual code is based on various other colorschemes. The structure is
" based on https://github.com/joshdick/onedark.vim .


" ===== Utility functions =====================================================

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


" ===== General setup =========================================================

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


" ===== Apply the colors ======================================================

" Fetch the colors
let s:colors = allnightlong#GetColors()

" ===== The overall window

" === Default Styling
call s:h("Normal", { "fg": s:colors.base_light_grey, "bg": s:colors.base_dark_grey })
" TODO: Might have an even darker foreground color, but still visible
call s:h("EndOfBuffer", { "fg": s:colors.base_medium_grey, "bg": s:colors.base_dark_grey })
" TODO: When is this actually used?
call s:h("NonText", { "fg": s:colors.work_pink })

" === Line Number Column
" This is only the default static formatting, see ``Cursorline`` block below.
" TODO: Might be even a shade darker
call s:h("LineNr", { "fg": s:colors.base_medium_grey })
call s:h("LineNrAbove", { "fg": s:colors.base_medium_grey })
call s:h("LineNrBelow", { "fg": s:colors.base_medium_grey })

" === Sign Column
" This is only the default styling of the column, the actual *signs* may need
" additional styling.
call s:h("SignColumn", { "fg": s:colors.base_medium_grey, "bg": s:colors.base_dark_grey })

" === Vertical Split
" While the window is splitted vertically, a column is used as seperator.
call s:h("VertSplit", { "fg": s:colors.base_dark_grey, "bg": s:colors.dark_grey_light })

" === Hover Styling
" Apply dedicated styling for the line of the cursor.
" Note: Must be activated in ``.vimrc`` with ``cursorline`` / ``cursorcolumn``.
call s:h("CursorLine", { "bg": s:colors.dark_grey_light })
call s:h("CursorLineNr", { "fg": s:colors.orange_dark, "bg": s:colors.dark_grey_light })
call s:h("CursorLineSign", { "bg": s:colors.dark_grey_light })  " FIXME not working!
call s:h("CursorColumn", { "bg": s:colors.dark_grey_light })


" ===== Special Highlight Groups

" === Error messages
" E.g. unknown commands
call s:h("ErrorMsg", { "fg": s:colors.grey_lightest, "bg": s:colors.base_red })

" === Directory
call s:h("Directory", { "fg": s:colors.base_blue })

" === Search Results
" Note: Must be activated in ``.vimrc`` with ``set hlsearch`` / ``set incsearch``.
call s:h("Search", { "fg": s:colors.base_dark_grey, "bg": s:colors.base_yellow })
call s:h("IncSearch", { "fg": s:colors.base_dark_grey, "bg": s:colors.base_orange })


" ===== Syntax Highlighting ===================================================

call s:h("Comment", { "fg": s:colors.base_medium_grey })

call s:h("Constant", { "fg": s:colors.base_green })
call s:h("Number", { "fg": s:colors.base_orange })
highlight link Boolean Number

call s:h("Identifier", { "fg": s:colors.base_light_grey })
call s:h("Function", { "fg": s:colors.orange_dark })

call s:h("Statement", { "fg": s:colors.base_blue })

call s:h("PreProc", { "fg": s:colors.base_purple })
call s:h("Type", { "fg": s:colors.base_teal })
call s:h("Special", { "fg": s:colors.base_medium_grey })

call s:h("Ignore", { "fg": s:colors.base_medium_grey })
call s:h("Error", { "fg": s:colors.grey_lightest, "bg": s:colors.base_red })
" TODO: The inverted style is good, the color might need adjustment
call s:h("Todo", { "fg": s:colors.base_dark_grey, "bg": s:colors.orange_dark })
