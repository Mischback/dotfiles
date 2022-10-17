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
call s:h("Normal", { "fg": s:colors.light_grey_base, "bg": s:colors.dark_grey_base })
call s:h("EndOfBuffer", { "fg": s:colors.dark_grey_light, "bg": s:colors.dark_grey_base })
" TODO: When is this actually used?
call s:h("NonText", { "fg": s:colors.work_pink })

" === Line Number Column
" This is only the default static formatting, see ``Cursorline`` block below.
call s:h("LineNr", { "fg": s:colors.medium_grey_dark })
call s:h("LineNrAbove", { "fg": s:colors.medium_grey_dark })
call s:h("LineNrBelow", { "fg": s:colors.medium_grey_dark })

" === Additional Columns
" These columns are used to indicate folding and / or other additional
" information, like the indicators of gitgutter.
call s:h("SignColumn", {})
call s:h("FoldColumn", {})
" TODO: Probably this needs a color adjustment
call s:h("Folded", { "fg": s:colors.yellow_light })
call s:h("ColorColumn", { "bg": s:colors.yellow_base })

" === Vertical Split
" While the window is splitted vertically, a column is used as seperator.
call s:h("VertSplit", { "fg": s:colors.dark_grey_base, "bg": s:colors.dark_grey_light })

" === Hover Styling
" Apply dedicated styling for the line of the cursor.
" Note: Must be activated in ``.vimrc`` with ``cursorline`` / ``cursorcolumn``.
" Note: In diff mode the default colors are kept, instead, underline is used.
if &diff
    call s:h("CursorLine", { "gui": "underline", "cterm": "underline" })
else
    call s:h("CursorLine", { "bg": s:colors.dark_grey_light })
endif
call s:h("CursorLineNr", { "fg": s:colors.orange_dark, "bg": s:colors.dark_grey_light })
call s:h("CursorColumn", { "bg": s:colors.dark_grey_light })


" ===== Special Highlight Groups

" === Error messages
" E.g. unknown commands
call s:h("ErrorMsg", { "fg": s:colors.light_grey_light, "bg": s:colors.red_base })

" === Directory
" E.g. in vim's :Explore, but also used by NerdTree plugin
call s:h("Directory", { "fg": s:colors.blue_base })

" === Search Results
" Note: Must be activated in ``.vimrc`` with ``set hlsearch`` / ``set incsearch``.
call s:h("Search", { "fg": s:colors.dark_grey_base, "bg": s:colors.yellow_base })
call s:h("IncSearch", { "fg": s:colors.dark_grey_base, "bg": s:colors.orange_base })

" === Diff
" These groups are used in vim's diff mode (``vim -d``), but are picked up by
" gitgutter for the *signs* column (may be overridden for gitgutter).
call s:h("DiffAdd", { "fg": s:colors.dark_grey_base, "bg": s:colors.green_light })
call s:h("DiffChange", { "fg": s:colors.yellow_base, "gui": "underline", "cterm": "underline" })
call s:h("DiffText", { "fg": s:colors.dark_grey_base, "bg": s:colors.yellow_base })
call s:h("DiffDelete", { "fg": s:colors.dark_grey_base, "bg": s:colors.red_base })


" ===== Plugin-specific Highlighting ==========================================

" === NerdTree
highlight link NerdTreeCWD Function
highlight link NerdTreeDir Directory
highlight link NerdTreeDirSlash Directory
highlight link NerdTreeExecFile String
highlight link NerdTreeFile Ientifier
highlight link NerdTreeHelp Comment

" ===== highlight groups for my custom statusline implementation
" (see ``vimrc``)
call s:h("customStatusLineActive", { "fg": s:colors.dark_grey_base, "bg": s:colors.medium_grey_light })
highlight! link StatusLine customStatusLineActive

call s:h("customStatusLineInactive", { "fg": s:colors.dark_grey_base, "bg": s:colors.dark_grey_light })
highlight! link StatusLineNC customStatusLineInactive

call s:h("customStatusLineActiveFileInfo", { "fg": s:colors.dark_grey_dark, "bg": s:colors.medium_grey_light })
call s:h("customStatusLineActiveFileInfoRO", { "fg": s:colors.red_base, "bg": s:colors.medium_grey_light })
call s:h("customStatusLineActiveFileInfoMod", { "fg": s:colors.teal_dark, "bg": s:colors.medium_grey_light })

call s:h("customStatusLineModeNormal", { "fg": s:colors.light_grey_dark, "bg": s:colors.dark_grey_light })
" call s:h("customStatusLineModeInsert", { "fg": s:colors.yellow_base, "bg": s:colors.dark_grey_light })
" call s:h("customStatusLineModeVisual", { "fg": s:colors.red_base, "bg": s:colors.dark_grey_light })
call s:h("customStatusLineModeInsert", { "fg": s:colors.dark_grey_base, "bg": s:colors.yellow_base })
call s:h("customStatusLineModeVisual", { "fg": s:colors.light_grey_light, "bg": s:colors.red_base })

call s:h("customStatusLineActiveHelp", { "fg": s:colors.dark_grey_base, "bg": s:colors.green_light })


" ===== Syntax Highlighting ===================================================
" See ``h w18`` for reference

call s:h("Comment", { "fg": s:colors.medium_grey_base })

call s:h("Constant", { "fg": s:colors.orange_dark })
call s:h("String", { "fg": s:colors.green_base })
call s:h("Character", { "fg": s:colors.green_light })
call s:h("Number", { "fg": s:colors.orange_base })
" TODO: ``Boolean`` is treated like a ``Number``. Needs evaluation during coding
highlight link Boolean Number

call s:h("Identifier", { "fg": s:colors.light_grey_base })
call s:h("Function", { "fg": s:colors.orange_dark })

" FIXME: blue_light still a bit off.
call s:h("Statement", { "fg": s:colors.blue_base })

call s:h("PreProc", { "fg": s:colors.purple_base })
call s:h("Define", { "fg": s:colors.purple_light })
highlight! link Macro Define
" TODO: This is *really* dark, but selection is limited in 256 color mode
call s:h("PreCondit", { "fg": s:colors.purple_dark })

call s:h("Type", { "fg": s:colors.teal_base })
call s:h("StorageClass", { "fg": s:colors.blue_light })

call s:h("Special", { "fg": s:colors.orange_dark })
call s:h("Tag", { "fg": s:colors.medium_grey_light })
call s:h("Delimiter", { "fg": s:colors.medium_grey_light })
highlight! link SpecialComment Comment

call s:h("Ignore", { "fg": s:colors.medium_grey_base })
call s:h("Error", { "fg": s:colors.light_grey_light, "bg": s:colors.red_base })
" FIXME: The inverted style is good, the color needs adjustment!
"        The current color collides with the color for ``Function`` keywords.
call s:h("Todo", { "fg": s:colors.dark_grey_base, "bg": s:colors.yellow_base })


" ===== Custom Syntax Highlighting (language-specific)

" === C (possibly C++)
highlight! link cDefine Define
highlight! link cFormat Character
" FIXME: doesn't seem to work!
highlight! link cParen Delimiter

" === CSS
" FIXME: As of now, this is only done by looking at an inline style of an HTML
"        document. Might need refinement while working with CSS/SCSS files.
highlight! link cssUnitDecorators Identifier
highlight! link cssColor Character
call s:h("anlCssAttributeName", { "fg": s:colors.purple_light })
highlight! link cssBackgroundProp anlCssAttributeName
highlight! link cssBoxProp anlCssAttributeName
highlight! link cssTextProp anlCssAttributeName
highlight! link cssBorderProp anlCssAttributeName
highlight! link cssPositioningProp anlCssAttributeName
highlight! link cssFontProp anlCssAttributeName
highlight! link cssTableProp anlCssAttributeName
highlight! link cssPseudoclassId Function
highlight! link cssIdentifier StorageClass
highlight! link cssClassName cssIdentifier

" === HTML
call s:h("htmlH1", { "fg": s:colors.orange_base })
call s:h("htmlH3", { "fg": s:colors.orange_light })
highlight! link htmlTag Delimiter
highlight! link htmlEndTag htmlTag
highlight! link htmlTagName Type
highlight! link htmlSpecialTagName Special
highlight! link htmlArg Statement

" Django template-specific
highlight! link djangoTagBlock Define
highlight! link djangoStatement PreProc
call s:h("djangoArgument", { "fg": s:colors.orange_light })

" === Python (this assumes vim-python/python-syntax plugin)
highlight! link pythonClass Function
call s:h("pythonFunctionCall", { "fg": s:colors.blue_light })
highlight! link pythonNone pythonBuiltinType
highlight! link pythonStatement Conditional
highlight! link pythonStrFormatting Character
