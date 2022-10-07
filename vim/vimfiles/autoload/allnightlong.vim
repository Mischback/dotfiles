" SPDX-FileCopyrightText: 2022 Mischback
" SPDX-License-Identifier: MIT
" SPDX-FileType: SOURCE

" Provide a common and coherent color palette.
"
" This is placed in vim's ``autoload``, as the palette will be used by the
" actual colorscheme and to style other vim plugins (e.g. ``airline``).


" Define the color palette of the colorscheme.
let s:colors = {
    \ "grey_0": { "gui": "#080808", "cterm": "232", "cterm16": "0" },
    \ "grey_1": { "gui": "#262626", "cterm": "235", "cterm16": "0" },
    \ "grey_2": { "gui": "#444444", "cterm": "238", "cterm16": "0" },
    \ "grey_3": { "gui": "#626262", "cterm": "241", "cterm16": "0" },
    \ "grey_5": { "gui": "#767676", "cterm": "243", "cterm16": "8" },
    \ "grey_10": { "gui": "#b2b2b2", "cterm": "249", "cterm16": "7" },
    \ "red": { "gui": "#ff5f00", "cterm": "202", "cterm16": "9" },
    \ "green": { "gui": "#87af00", "cterm": "106", "cterm16": "10" },
    \ "yellow": { "gui": "#ffd700", "cterm": "220", "cterm16": "11" },
    \ "blue": { "gui": "#5fafff", "cterm": "75", "cterm16": "12" },
    \ "purple": { "gui": "#af87ff", "cterm": "141", "cterm16": "13" },
    \ "orange": { "gui": "#ff8700", "cterm": "208", "cterm16": "3" },
    \ "pink": { "gui": "#ff00ff", "cterm": "201", "cterm16": "13" },
\}

" Return the color palette
function! allnightlong#GetColors()
    return s:colors
endfunction
