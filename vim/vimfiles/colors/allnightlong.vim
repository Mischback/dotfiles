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

" Apply the colors to highlight groups

" The overall window
call s:h("Normal", { "fg": s:colors.grey_70, "bg": s:colors.grey_11 })

" The default set of syntax-related colors

call s:h("Comment", { "fg": s:colors.grey_46 })
call s:h("String", { "fg": s:colors.green })
call s:h("Character", { "fg": s:colors.green_bright })

" Constants
" TODO: Still needs to be done!
" The following mappings point to ``Constant``
" - ``String`` from ``syncolor.vim``
" - ``Character`` from ``syncolor.vim``
" - ``Number`` from ``syncolor.vim``
" - ``Boolean`` from ``syncolor.vim``
" - ``cConstant`` from ``c.vim``
" - ``typescriptGlobal`` from ``typescriptcommon.vim``
" call s:h("Constant", { "fg": s:colors.green })

" Strings
" The following mappings point to ``String``
" - ``cString`` from ``c.vim``
" - ``htmlValue`` from ``html.vim``
" - ``htmlPreAttr`` from ``html.vim``
" - ``htmlString`` from ``html.vim``
" - ``htmlValue`` from ``html.vim``
" - ``pythonString`` from ``python.vim``
" - ``pythonRawString`` from ``python.vim``
" - ``pythonQuotes`` from ``python.vim``
" - ``typescriptString`` from ``typescriptcommon.vim``
" - ``typescriptStringLiteralType`` from ``typescriptcommon.vim``
" - ``typescriptTemplateLiteralType`` from ``typescriptcommong.vim``
" - ``typescriptStringMember`` from ``typescriptcommon.vim``
" - ``typescriptTemplate`` from ``typescriptcommon.vim``
" - ``typescriptEventString`` from ``typescriptcommon.vim``
" - ``typescriptDestructureString`` from ``typescriptcommon.vim``
" - ``typescriptRegexpString`` from ``typescriptcommon.vim``
" - ``typescriptStringProperty`` from ``typescriptcommon.vim``
" - ``vimString`` from ``vim.vim``
" call s:h("String", { "fg": s:work_1 })

" Numbers
" The following mappings point to ``Number``
" - ``cNumber`` from ``c.vim``
" - ``cOctal`` from ``c.vim``
" - ``pythonNumber`` from ``python.vim`` (configurable?!)
" - ``typescriptNumber`` from ``typescriptcommon.vim``
" - ``Float`` from ``syncolor.vim``
" - ``vimHiNmbr`` from ``vim.vim``
" - ``vimMark`` from ``vim.vim``
" - ``vimNumber`` from ``vim.vim``
" call s:h("Number", { "fg": s:work_1 })
" highlight link Boolean Number

" Identifiers
" The following mappings point to ``Identifier``
" - ``htmlEndTag`` from ``html.vim`` (e.g. htmlTagName) FIXME: This needs adjustment (language-specific!)
" - ``Function`` from ``syncolor.vim``
" - ``typescriptVariable`` from ``typescriptcommon.vim``
" - ``typescriptEnumKeyword`` from ``typescriptcommon.vim``
" - ``typescriptOperator`` from ``typescriptcommon.vim``
" - ``typescriptKeywordOp`` from ``typescriptcommon.vim``
" - ``typescriptTypeParameter`` from ``typescriptcommon.vim``
" - ``typescriptConstructSignature`` from ``typescriptcommon.vim``
" - ``typescriptAliasDeclaration`` from ``typescriptcommon.vim``
" - ``typescriptTypeReference`` from ``typescriptcommon.vim``
" - ``vimFuncVar`` from ``vim.vim``
" - ``vimSpecFile`` from ``vim.vim``
" - ``vimVar`` from ``vim.vim``
" call s:h("Identifier", { "fg": s:ui_fg })
" call s:h("Function", { "fg": s:work_1 })

" Statements
" The followin mappings point to ``Statement``
" - ``cStatement`` from ``c.vim`` (goto, break, return, continue, ...)
" - ``htmlStatement`` from ``html.vim`` (e.g. htmlTagName)
" - ``pythonStatement`` from ``python.vim`` (def, class, False, None, True, as, break, ...)
" - ``pythonAsync`` from ``python.vim``
" - ``Conditional`` from ``syncolor.vim``
" - ``Repeat`` from ``syncolor.vim``
" - ``Label`` from ``syncolor.vim``
" - ``Operator`` from ``syncolor.vim``
" - ``Keyword`` from ``syncolor.vim``
" - ``Exception`` from ``syncolor.vim``
" - ``typescriptStatementKeyword`` from ``typescriptcommon.vim``
" - ``vimCommand`` from ``vim.vim``
" - ``vimKeyword`` from ``vim.vim``
" - ``vimSearchDelim`` from ``vim.vim``
" - ``vimSetSep`` from ``vim.vim``
" - ``vimStatement`` from ``vim.vim``
" call s:h("Statement", { "fg": s:colors.blue })
" call s:h("Keyword", { "fg": s:work_1 })

" Preprocessor stuff
" FIXME: Find another color for this!
" The following mappings point to ``PreProc``
" - ``cOctalZero`` from ``c.vim``
" - ``cPreProc`` from ``c.vim``
" - ``htmlPreStmt`` from ``html.vim``
" - ``htmlPreProc`` from ``html.vim``
" - ``htmlPreProcAttrName`` from ``html.vim``
" - ``[OVERRIDDEN] Include`` from ``syncolor.vim``
" - ``Define`` from ``syncolor.vim``
" - ``Macro`` from ``syncolor.vim``
" - ``PreCondit`` from ``syncolor.vim``
" - ``typescriptDestructureVariable`` from ``typescriptcommon.vim``
" - ``typescriptFuncArg`` from ``typescriptcommon.vim``
" - ``typescriptArrowFuncArg`` from ``typescriptcommon.vim``
" - ``typescriptOptionalMark`` from ``typescriptcommon.vim``
" - ``typescriptCall`` from ``typescriptcommon.vim``
" - ``typescriptParamImpl`` from ``typescriptcommon.vim``
" - ``vimCommentTitle`` from ``vim.vim``
" - ``vimEnvvar`` from ``vim.vim``
" - ``vimHiAttrib`` from ``vim.vim``
" - ``vimHLMod`` from ``vim.vim``
" - ``vimMenuName`` from ``vim.vim``
" - ``vimOption`` from ``vim.vim``  " FIXME: Override this!
" call s:h("PreProc", { "fg": s:colors.orange })

" Include statements
" The following mappings point to ``Include``
" - ``cInclude`` from ``c.vim`` " TODO: Is it really desirable to make the #include statements stand out?
" - ``pythonInclude`` from ``python.vim``
" - ``typescriptRef`` from ``typescriptcommon.vim``
" call s:h("Include", { "fg": s:work_1 })

" call s:h("Type", { "fg": s:colors.purple })

" call s:h("Special", { "fg": s:colors.yellow })

" call s:h("Error", { "fg": s:colors.red })


" ===== C-specific
" cFormat (format string components; points to cSpecial in ``c.vim``)


" ===== Python-specific
" pythonBuiltin (e.g. ``None``)
" pythonDecorator (this is the ``@``)
" pythonDecoratorName (the actual name)
" pythonExceptions (e.g. ``KeyError``


" ===== TypeScript-specific
" typescriptImport (make this consistent with C/Python)
" highlight link typescriptImport Include
" typescriptExport
" typescriptDocNotation (tags in docstrings, where the docstrings are comments, e.g. ``@param`` -> '@')
" typescriptDocTags (tags in docstrings, where the docstrings are comments, e.g. ``@param`` -> 'param)


" ===== VIM-specific
" vimSetEqual
" vimOption
