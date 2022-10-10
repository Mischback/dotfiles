" SPDX-FileCopyrightText: 2022 Mischback
" SPDX-License-Identifier: MIT
" SPDX-FileType: SOURCE

" Provide a common and coherent color palette.
"
" This is placed in vim's ``autoload``, as the palette will be used by the
" actual colorscheme and to style other vim plugins (e.g. ``airline``).


" Define the color palette of the colorscheme.
let s:colors = {
    \ "grey_11": { "gui": "#1c1c1c", "cterm": "234", "cterm16": "0" },
    \ "grey_46": { "gui": "#767676", "cterm": "243", "cterm16": "8" },
    \ "grey_70": { "gui": "#b2b2b2", "cterm": "249", "cterm16": "7" },
    \ "green": { "gui": "#87af00", "cterm": "106", "cterm16": "10" },
    \ "green_bright": { "gui": "#87d700", "cterm": "112", "cterm16": "10" },
    \ "work_pink": { "gui": "#ff00ff", "cterm": "201", "cterm16": "13" },
    \ "work_green": { "gui": "#00ff00", "cterm": "46", "cterm16": "10" },
\}

" Return the color palette
function! allnightlong#GetColors()
    return s:colors
endfunction
