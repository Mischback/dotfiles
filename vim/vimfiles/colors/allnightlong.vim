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


" ===== Apply the colors ======================================================

" The overall window
call s:h("Normal", { "fg": s:colors.base_light_grey, "bg": s:colors.base_dark_grey })


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
