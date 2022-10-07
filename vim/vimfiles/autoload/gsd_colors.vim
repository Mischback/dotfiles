" SPDX-FileCopyrightText: 2022 Mischback
" SPDX-License-Identifier: MIT
" SPDX-FileType: SOURCE

" Provide a common and coherent color palette.
"
" This is placed in vim's ``autoload``, as the palette will be used by the
" actual colorscheme and to style other vim plugins (e.g. ``airline``).


" Define the color palette of the colorscheme.
let s:colors = {
    \ "darkgrey": { "gui": "#262626", "cterm": "235", "cterm16": "0" },
    \ "lightgrey": { "gui": "#b2b2b2", "cterm": "249", "cterm16": "7" },
    \ "mediumgrey": { "gui": "#767676", "cterm": "243", "cterm16": "8" },
    \ "red": { "gui": "#ff5f00", "cterm": "202", "cterm16": "9" },
    \ "green": { "gui": "#87af00", "cterm": "106", "cterm16": "10" },
    \ "yellow": { "gui": "#ffd700", "cterm": "220", "cterm16": "11" },
    \ "blue": { "gui": "#5fafff", "cterm": "75", "cterm16": "12" },
    \ "purple": { "gui": "#af87ff", "cterm": "141", "cterm16": "13" },
    \ "orange": { "gui": "#ff8700", "cterm": "208", "cterm16": "3" },
\}

" Return the color palette
function! gsd_colors#GetColors()
    return s:colors
endfunction
