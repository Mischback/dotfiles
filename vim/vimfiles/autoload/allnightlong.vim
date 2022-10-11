" SPDX-FileCopyrightText: 2022 Mischback
" SPDX-License-Identifier: MIT
" SPDX-FileType: SOURCE

" Provide a common and coherent color palette.
"
" This is placed in vim's ``autoload``, as the palette will be used by the
" actual colorscheme and to style other vim plugins (e.g. ``airline``).


" Define the color palette of the colorscheme.
let s:colors = {
    \ "base_dark_grey": { "gui": "#000000", "cterm": "16", "cterm16": "0" },
    \ "base_medium_grey": { "gui": "#808080", "cterm": "244", "cterm16": "8" },
    \ "base_light_grey": { "gui": "#bcbcbc", "cterm": "250", "cterm16": "7" },
    \ "base_green": { "gui": "#008700", "cterm": "28", "cterm16": "2" },
    \ "base_blue": { "gui": "#0000ff", "cterm": "21", "cterm16": "12" },
    \ "base_purple": { "gui": "#870087", "cterm": "90", "cterm16": "5" },
    \ "base_teal": { "gui": "#008787", "cterm": "30", "cterm16": "6" },
    \ "work_pink": { "gui": "#ff00ff", "cterm": "201", "cterm16": "13" },
\}

" Return the color palette
function! allnightlong#GetColors()
    return s:colors
endfunction
