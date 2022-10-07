" SPDX-FileCopyrightText: 2022 Mischback
" SPDX-License-Identifier: MIT
" SPDX-FileType: SOURCE

" Provide the actual colorscheme for vim.
"
" The actual code is based on various other colorschemes. The structure is
" based on https://github.com/joshdick/onedark.vim .
"
" **gsd** means *get shit done*, as this colorscheme is intended for highly
" productive use.


" Reset existing highlights
highlight clear
if exists("syntax_on")
    syntax reset
endif


" Activate vim's 256 color mode, independent of the acutal terminal in use
set t_Co=256

" Provide the actual name of the colorscheme
let g:colors_name="gsd"


" Initialize support for italics
"
" Support for italics is dependent on the terminal in use and the font in
" this terminal. Support for italics is deactivated by default, but the user
" may *opt-in* by setting this to ``1`` in his ``.vimrc``.
if !exists("g:gsd_terminal_italics")
    let g:gsd_terminal_italics = 0
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
let s:colors = gsd_colors#GetColors()

" Give the palette a semantic meaning
let s:work = s:colors.pink
let s:ui_bg = s:colors.grey_1
let s:ui_fg = s:colors.grey_10
let s:ui_fg_dark = s:colors.grey_3
let s:ui_hover_bg = s:colors.grey_2
let s:ui_hover_fg = s:colors.red
let s:ui_invert_fg = s:colors.grey_1
let s:ui_invert_bg = s:colors.grey_10
let s:ui_attention_fg = s:ui_invert_fg
let s:ui_attention_bg = s:colors.yellow
let s:ui_cursor_bg = s:colors.yellow
let s:ui_cursor_fg = s:ui_invert_fg


" Apply the colors to highlight groups

" The overall window (only the lines of the buffer)
call s:h("Normal", { "fg": s:ui_fg, "bg": s:ui_bg })

" e.g. '~' and '@' at the end of the window
call s:h("NonText", { "fg": s:ui_fg_dark })

" Line number
" This is the static default formatting. For the currently active line see
" ``CursorLine`` and ``CursorLineNr`` below.
call s:h("LineNr", { "fg": s:ui_fg_dark })

" Modify the currently active line
" Must be activated in ``.vimrc`` with ``cursorline``
call s:h("CursorLine", { "bg": s:ui_hover_bg })
call s:h("CursorLineNr", { "fg": s:ui_hover_fg, "bg": s:ui_hover_bg })

" Styling the vertical split
call s:h("VertSplit", { "fg": s:ui_bg, "bg": s:ui_hover_bg })

" The character under the cursor
" FIXME: Doesn't seem to work, investigate!
call s:h("Cursor", { "fg": s:ui_cursor_fg, "bg": s:ui_cursor_bg })
call s:h("ICursor", { "fg": s:ui_cursor_fg, "bg": s:ui_cursor_bg })

" Highlight search results
" Must be activated in ``.vimrc`` with ``set hlsearch``.
call s:h("Search", { "fg": s:ui_attention_fg, "bg": s:ui_attention_bg })
call s:h("IncSearch", { "fg": s:ui_attention_fg, "bg": s:ui_attention_bg })
