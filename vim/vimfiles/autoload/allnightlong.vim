" SPDX-FileCopyrightText: 2022 Mischback
" SPDX-License-Identifier: MIT
" SPDX-FileType: SOURCE

" Provide a common and coherent color palette.
"
" This is placed in vim's ``autoload``, as the palette will be used by the
" actual colorscheme and to style other vim plugins (e.g. ``airline``).


" Define the color palette of the colorscheme.
" TODO: Remove unused colors when finalizing the colorscheme!
" TODO: Document all colors as constructed, even if they get removed!
let s:colors = {
    \ "dark_grey_base": { "gui": "#1c1c1c", "cterm": "234", "cterm16": "0" },
    \ "dark_grey_dark": { "gui": "#080808", "cterm": "232", "cterm16": "0" },
    \ "dark_grey_light": { "gui": "#3a3a3a", "cterm": "237", "cterm16": "0" },
    \ "medium_grey_base": { "gui": "#767676", "cterm": "243", "cterm16": "8" },
    \ "medium_grey_dark": { "gui": "#585858", "cterm": "240", "cterm16": "8" },
    \ "medium_grey_light": { "gui": "#949494", "cterm": "246", "cterm16": "8" },
    \ "light_grey_base": { "gui": "#b2b2b2", "cterm": "249", "cterm16": "7" },
    \ "light_grey_dark": { "gui": "#949494", "cterm": "246", "cterm16": "7" },
    \ "light_grey_light": { "gui": "#d0d0d0", "cterm": "252", "cterm16": "15" },
    \ "green_base": { "gui": "#87af00", "cterm": "106", "cterm16": "2" },
    \ "green_dark": { "gui": "#878700", "cterm": "100", "cterm16": "2" },
    \ "green_light": { "gui": "#5fd700", "cterm": "148", "cterm16": "2" },
    \ "blue_base": { "gui": "#5fafff", "cterm": "75", "cterm16": "12" },
    \ "blue_light": { "gui": "#87d7ff", "cterm": "117", "cterm16": "12" },
    \ "purple_base": { "gui": "#af5fd7", "cterm": "134", "cterm16": "5" },
    \ "purple_dark": { "gui": "#5f5fd7", "cterm": "62", "cterm16": "5" },
    \ "purple_light": { "gui": "#af87d7", "cterm": "140", "cterm16": "5" },
    \ "teal_base": { "gui": "#00af87", "cterm": "36", "cterm16": "6" },
    \ "teal_dark": { "gui": "#005f00", "cterm": "22", "cterm16": "6" },
    \ "teal_light": { "gui": "#5fffaf", "cterm": "85", "cterm16": "6" },
    \ "red_base": { "gui": "#af0000", "cterm": "124", "cterm16": "1" },
    \ "orange_base": { "gui": "#ff8700", "cterm": "208", "cterm16": "2" },
    \ "orange_dark": { "gui": "#ff5f00", "cterm": "202", "cterm16": "2" },
    \ "yellow_base": { "gui": "#ffd700", "cterm": "220", "cterm16": "11" },
    \ "yellow_light": { "gui": "#ffff87", "cterm": "228", "cterm16": "11" },
    \ "work_pink": { "gui": "#ff00ff", "cterm": "201", "cterm16": "13" },
\}

" Return the color palette
function! allnightlong#GetColors()
    return s:colors
endfunction
