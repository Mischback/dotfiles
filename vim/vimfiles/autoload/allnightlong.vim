" SPDX-FileCopyrightText: 2022 Mischback
" SPDX-License-Identifier: MIT
" SPDX-FileType: SOURCE

" Provide a common and coherent color palette.
"
" This is placed in vim's ``autoload``, as the palette will be used by the
" actual colorscheme and to style other vim plugins (e.g. ``airline``).


" Define the color palette of the colorscheme.
let s:colors = {
    \ "base_dark_grey": { "gui": "#1c1c1c", "cterm": "234", "cterm16": "0" },
    \ "base_medium_grey": { "gui": "#767676", "cterm": "243", "cterm16": "8" },
    \ "base_light_grey": { "gui": "#b2b2b2", "cterm": "249", "cterm16": "7" },
    \ "base_green": { "gui": "#87af00", "cterm": "106", "cterm16": "2" },
    \ "base_blue": { "gui": "#5fafff", "cterm": "75", "cterm16": "12" },
    \ "base_purple": { "gui": "#af5fd7", "cterm": "134", "cterm16": "5" },
    \ "base_teal": { "gui": "#00af87", "cterm": "36", "cterm16": "6" },
    \ "work_pink": { "gui": "#ff00ff", "cterm": "201", "cterm16": "13" },
\}

" Return the color palette
function! allnightlong#GetColors()
    return s:colors
endfunction
