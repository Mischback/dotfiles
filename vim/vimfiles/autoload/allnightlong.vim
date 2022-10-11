" SPDX-FileCopyrightText: 2022 Mischback
" SPDX-License-Identifier: MIT
" SPDX-FileType: SOURCE

" Provide a common and coherent color palette.
"
" This is placed in vim's ``autoload``, as the palette will be used by the
" actual colorscheme and to style other vim plugins (e.g. ``airline``).


" Define the color palette of the colorscheme.
let s:colors = {
    \ "work_pink": { "gui": "#ff00ff", "cterm": "201", "cterm16": "13" },
\}

" Return the color palette
function! allnightlong#GetColors()
    return s:colors
endfunction
