" Copyright (C) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
" Copyright (C) 2016-present Sven Greb <development@svengreb.de>

" Project: Nord Vim
" Repository: https://github.com/arcticicestudio/nord-vim
" License: MIT
" ----------------------------------------------
" NOTE: Fork of nord with some modifications

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name = "nord"
let s:nord_vim_version="0.12.0"
set background=dark

let s:nord0_gui = "#252A33"
let s:nord1_gui = "#3B4252"
let s:nord2_gui = "#434C5E"
let s:nord3_gui = "#4C566A"
let s:nord3_gui_bright = "#616E88"
let s:nord4_gui = "#D8DEE9"
let s:nord5_gui = "#E5E9F0"
let s:nord6_gui = "#ECEFF4"
let s:nord7_gui = "#8FBCBB"
let s:nord8_gui = "#88C0D0"
let s:nord9_gui = "#81A1C1"
let s:nord10_gui = "#5E81AC"
let s:nord11_gui = "#BF616A"
let s:nord12_gui = "#D08770"
let s:nord13_gui = "#EBCB8B"
let s:nord14_gui = "#A3BE8C"
let s:nord15_gui = "#B48EAD"

let s:nord1_term = "0"
let s:nord3_term = "8"
let s:nord5_term = "7"
let s:nord6_term = "15"
let s:nord7_term = "14"
let s:nord8_term = "6"
let s:nord9_term = "4"
let s:nord10_term = "12"
let s:nord11_term = "1"
let s:nord12_term = "11"
let s:nord13_term = "3"
let s:nord14_term = "2"
let s:nord15_term = "5"

let s:nord3_gui_brightened = [
  \ s:nord3_gui,
  \ "#4e586d",
  \ "#505b70",
  \ "#525d73",
  \ "#556076",
  \ "#576279",
  \ "#59647c",
  \ "#5b677f",
  \ "#5d6982",
  \ "#5f6c85",
  \ "#616e88",
  \ "#63718b",
  \ "#66738e",
  \ "#687591",
  \ "#6a7894",
  \ "#6d7a96",
  \ "#6f7d98",
  \ "#72809a",
  \ "#75829c",
  \ "#78859e",
  \ "#7b88a1",
\ ]

let s:bold = "bold,"
let s:italic = "italic,"
let s:underline = "underline,"

if !exists('g:nord_uniform_status_lines')
  let g:nord_uniform_status_lines = 0
endif

function! s:logWarning(msg)
  echohl WarningMsg
  echomsg 'nord: warning: ' . a:msg
  echohl None
endfunction

if !exists("g:nord_bold_vertical_split_line")
  let g:nord_bold_vertical_split_line = 0
endif

function! s:hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  if a:guifg != ""
    exec "hi " . a:group . " guifg=" . a:guifg
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=" . a:guibg
  endif
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . a:ctermbg
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . substitute(a:attr, "undercurl", s:underline, "")
  endif
  if a:guisp != ""
    exec "hi " . a:group . " guisp=" . a:guisp
  endif
endfunction

"+---------------+
"+ UI Components +
"+---------------+
"+--- Attributes ---+
call s:hi("Bold", "", "", "", "", s:bold, "")
call s:hi("Italic", "", "", "", "", s:italic, "")
call s:hi("Underline", "", "", "", "", s:underline, "")

"+--- Editor ---+
call s:hi("ColorColumn", "", s:nord1_gui, "NONE", s:nord1_term, "", "")
call s:hi("Cursor", s:nord0_gui, s:nord4_gui, "", "NONE", "", "")
call s:hi("CursorLine", "", s:nord1_gui, "NONE", s:nord1_term, "NONE", "")
call s:hi("Error", s:nord0_gui, s:nord11_gui, "", s:nord11_term, "", "")
call s:hi("iCursor", s:nord0_gui, s:nord4_gui, "", "NONE", "", "")
call s:hi("LineNr", s:nord3_gui, s:nord0_gui, s:nord3_term, "NONE", "", "")
call s:hi("MatchParen", s:nord8_gui, s:nord3_gui, s:nord8_term, s:nord3_term, "", "")
call s:hi("NonText", s:nord2_gui, "", s:nord3_term, "", "", "")
call s:hi("Normal", s:nord4_gui, s:nord0_gui, "NONE", "NONE", "", "")
call s:hi("PMenu", s:nord4_gui, s:nord2_gui, "NONE", s:nord1_term, "NONE", "")
call s:hi("PmenuSbar", s:nord4_gui, s:nord2_gui, "NONE", s:nord1_term, "", "")
call s:hi("PMenuSel", s:nord8_gui, s:nord3_gui, s:nord8_term, s:nord3_term, "", "")
call s:hi("PmenuThumb", s:nord8_gui, s:nord3_gui, "NONE", s:nord3_term, "", "")
call s:hi("SpecialKey", s:nord3_gui, "", s:nord3_term, "", "", "")
call s:hi("SpellBad", s:nord11_gui, s:nord0_gui, s:nord11_term, "NONE", "undercurl", s:nord11_gui)
call s:hi("SpellCap", s:nord13_gui, s:nord0_gui, s:nord13_term, "NONE", "undercurl", s:nord13_gui)
call s:hi("SpellLocal", s:nord5_gui, s:nord0_gui, s:nord5_term, "NONE", "undercurl", s:nord5_gui)
call s:hi("SpellRare", s:nord6_gui, s:nord0_gui, s:nord6_term, "NONE", "undercurl", s:nord6_gui)
call s:hi("Visual", "", s:nord2_gui, "", s:nord1_term, "", "")
call s:hi("VisualNOS", "", s:nord2_gui, "", s:nord1_term, "", "")
"+- Neovim Support -+
call s:hi("healthError", s:nord11_gui, s:nord1_gui, s:nord11_term, s:nord1_term, "", "")
call s:hi("healthSuccess", s:nord14_gui, s:nord1_gui, s:nord14_term, s:nord1_term, "", "")
call s:hi("healthWarning", s:nord13_gui, s:nord1_gui, s:nord13_term, s:nord1_term, "", "")
call s:hi("TermCursorNC", "", s:nord1_gui, "", s:nord1_term, "", "")

"+- Vim 8 Terminal Colors -+
if has('terminal')
  let g:terminal_ansi_colors = [s:nord1_gui, s:nord11_gui, s:nord14_gui, s:nord13_gui, s:nord9_gui, s:nord15_gui, s:nord8_gui, s:nord5_gui, s:nord3_gui, s:nord11_gui, s:nord14_gui, s:nord13_gui, s:nord9_gui, s:nord15_gui, s:nord7_gui, s:nord6_gui]
endif

"+- Neovim Terminal Colors -+
if has('nvim')
  let g:terminal_color_0 = s:nord1_gui
  let g:terminal_color_1 = s:nord11_gui
  let g:terminal_color_2 = s:nord14_gui
  let g:terminal_color_3 = s:nord13_gui
  let g:terminal_color_4 = s:nord9_gui
  let g:terminal_color_5 = s:nord15_gui
  let g:terminal_color_6 = s:nord8_gui
  let g:terminal_color_7 = s:nord5_gui
  let g:terminal_color_8 = s:nord3_gui
  let g:terminal_color_9 = s:nord11_gui
  let g:terminal_color_10 = s:nord14_gui
  let g:terminal_color_11 = s:nord13_gui
  let g:terminal_color_12 = s:nord9_gui
  let g:terminal_color_13 = s:nord15_gui
  let g:terminal_color_14 = s:nord7_gui
  let g:terminal_color_15 = s:nord6_gui
endif

"+--- Gutter ---+
call s:hi("CursorColumn", "", s:nord1_gui, "NONE", s:nord1_term, "", "")
call s:hi("CursorLineNr", s:nord4_gui, s:nord0_gui, "NONE", "", "NONE", "")
call s:hi("Folded", s:nord3_gui, s:nord1_gui, s:nord3_term, s:nord1_term, s:bold, "")
call s:hi("FoldColumn", s:nord3_gui, s:nord0_gui, s:nord3_term, "NONE", "", "")
call s:hi("SignColumn", s:nord1_gui, s:nord0_gui, s:nord1_term, "NONE", "", "")

"+--- Navigation ---+
call s:hi("Directory", s:nord8_gui, "", s:nord8_term, "NONE", "", "")

"+--- Prompt/Status ---+
call s:hi("EndOfBuffer", s:nord1_gui, "", s:nord1_term, "NONE", "", "")
call s:hi("ErrorMsg", s:nord4_gui, s:nord11_gui, "NONE", s:nord11_term, "", "")
call s:hi("ModeMsg", s:nord4_gui, "", "", "", "", "")
call s:hi("MoreMsg", s:nord4_gui, "", "", "", "", "")
call s:hi("Question", s:nord4_gui, "", "NONE", "", "", "")
if g:nord_uniform_status_lines == 0
  call s:hi("StatusLine", s:nord8_gui, s:nord3_gui, s:nord8_term, s:nord3_term, "NONE", "")
  call s:hi("StatusLineNC", s:nord4_gui, s:nord1_gui, "NONE", s:nord1_term, "NONE", "")
  call s:hi("StatusLineTerm", s:nord8_gui, s:nord3_gui, s:nord8_term, s:nord3_term, "NONE", "")
  call s:hi("StatusLineTermNC", s:nord4_gui, s:nord1_gui, "NONE", s:nord1_term, "NONE", "")
else
  call s:hi("StatusLine", s:nord8_gui, s:nord3_gui, s:nord8_term, s:nord3_term, "NONE", "")
  call s:hi("StatusLineNC", s:nord4_gui, s:nord3_gui, "NONE", s:nord3_term, "NONE", "")
  call s:hi("StatusLineTerm", s:nord8_gui, s:nord3_gui, s:nord8_term, s:nord3_term, "NONE", "")
  call s:hi("StatusLineTermNC", s:nord4_gui, s:nord3_gui, "NONE", s:nord3_term, "NONE", "")
endif
call s:hi("WarningMsg", s:nord0_gui, s:nord13_gui, s:nord1_term, s:nord13_term, "", "")
call s:hi("WildMenu", s:nord8_gui, s:nord1_gui, s:nord8_term, s:nord1_term, "", "")

"+--- Search ---+
call s:hi("IncSearch", s:nord6_gui, s:nord10_gui, s:nord6_term, s:nord10_term, s:underline, "")
call s:hi("Search", s:nord1_gui, s:nord8_gui, s:nord1_term, s:nord8_term, "NONE", "")

"+--- Tabs ---+
call s:hi("TabLine", s:nord4_gui, s:nord1_gui, "NONE", s:nord1_term, "NONE", "")
call s:hi("TabLineFill", s:nord4_gui, s:nord1_gui, "NONE", s:nord1_term, "NONE", "")
call s:hi("TabLineSel", s:nord8_gui, s:nord3_gui, s:nord8_term, s:nord3_term, "NONE", "")

"+--- Window ---+
call s:hi("Title", s:nord4_gui, "", "NONE", "", "NONE", "")

if g:nord_bold_vertical_split_line == 0
  call s:hi("VertSplit", s:nord2_gui, s:nord0_gui, s:nord3_term, "NONE", "NONE", "")
else
  call s:hi("VertSplit", s:nord2_gui, s:nord1_gui, s:nord3_term, s:nord1_term, "NONE", "")
endif

"+----------------------+
"+ Language Base Groups +
"+----------------------+
call s:hi("Boolean", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("Character", s:nord14_gui, "", s:nord14_term, "", "", "")
call s:hi("Comment", s:nord3_gui, "", s:nord3_term, "", s:italic, "")
call s:hi("Conditional", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("Constant", s:nord4_gui, "", "NONE", "", "", "")
call s:hi("Define", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("Delimiter", s:nord6_gui, "", s:nord6_term, "", "", "")
call s:hi("Exception", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("Float", s:nord15_gui, "", s:nord15_term, "", "", "")
call s:hi("Function", s:nord8_gui, "", s:nord8_term, "", "", "")
call s:hi("Identifier", s:nord4_gui, "", "NONE", "", "NONE", "")
call s:hi("Include", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("Keyword", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("Label", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("Number", s:nord15_gui, "", s:nord15_term, "", "", "")
call s:hi("Operator", s:nord9_gui, "", s:nord9_term, "", "NONE", "")
call s:hi("PreProc", s:nord9_gui, "", s:nord9_term, "", "NONE", "")
call s:hi("Repeat", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("Special", s:nord4_gui, "", "NONE", "", "", "")
call s:hi("SpecialChar", s:nord13_gui, "", s:nord13_term, "", "", "")
call s:hi("SpecialComment", s:nord8_gui, "", s:nord8_term, "", s:italic, "")
call s:hi("Statement", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("StorageClass", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("String", s:nord14_gui, "", s:nord14_term, "", "", "")
call s:hi("Structure", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("Tag", s:nord4_gui, "", "", "", "", "")
call s:hi("Todo", s:nord13_gui, "NONE", s:nord13_term, "NONE", "", "")
call s:hi("Type", s:nord9_gui, "", s:nord9_term, "", "NONE", "")
call s:hi("Typedef", s:nord9_gui, "", s:nord9_term, "", "", "")
hi! link Macro Define
hi! link PreCondit PreProc

"+-----------+
"+ Languages +
"+-----------+
call s:hi("asciidocAttributeEntry", s:nord10_gui, "", s:nord10_term, "", "", "")
call s:hi("asciidocAttributeList", s:nord10_gui, "", s:nord10_term, "", "", "")
call s:hi("asciidocAttributeRef", s:nord10_gui, "", s:nord10_term, "", "", "")
call s:hi("asciidocHLabel", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("asciidocListingBlock", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("asciidocMacroAttributes", s:nord8_gui, "", s:nord8_term, "", "", "")
call s:hi("asciidocOneLineTitle", s:nord8_gui, "", s:nord8_term, "", "", "")
call s:hi("asciidocPassthroughBlock", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("asciidocQuotedMonospaced", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("asciidocTriplePlusPassthrough", s:nord7_gui, "", s:nord7_term, "", "", "")
hi! link asciidocAdmonition Keyword
hi! link asciidocAttributeRef markdownH1
hi! link asciidocBackslash Keyword
hi! link asciidocMacro Keyword
hi! link asciidocQuotedBold Bold
hi! link asciidocQuotedEmphasized Italic
hi! link asciidocQuotedMonospaced2 asciidocQuotedMonospaced
hi! link asciidocQuotedUnconstrainedBold asciidocQuotedBold
hi! link asciidocQuotedUnconstrainedEmphasized asciidocQuotedEmphasized
hi! link asciidocURL markdownLinkText

call s:hi("awkCharClass", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("awkPatterns", s:nord9_gui, "", s:nord9_term, "", s:bold, "")
hi! link awkArrayElement Identifier
hi! link awkBoolLogic Keyword
hi! link awkBrktRegExp SpecialChar
hi! link awkComma Delimiter
hi! link awkExpression Keyword
hi! link awkFieldVars Identifier
hi! link awkLineSkip Keyword
hi! link awkOperator Operator
hi! link awkRegExp SpecialChar
hi! link awkSearch Keyword
hi! link awkSemicolon Delimiter
hi! link awkSpecialCharacter SpecialChar
hi! link awkSpecialPrintf SpecialChar
hi! link awkVariables Identifier

call s:hi("cIncluded", s:nord7_gui, "", s:nord7_term, "", "", "")
hi! link cOperator Operator
hi! link cPreCondit PreCondit

call s:hi("cmakeGeneratorExpression", s:nord10_gui, "", s:nord10_term, "", "", "")

hi! link csPreCondit PreCondit
hi! link csType Type
hi! link csXmlTag SpecialComment

call s:hi("cssAttributeSelector", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("cssDefinition", s:nord7_gui, "", s:nord7_term, "", "NONE", "")
call s:hi("cssIdentifier", s:nord7_gui, "", s:nord7_term, "", s:underline, "")
call s:hi("cssStringQ", s:nord7_gui, "", s:nord7_term, "", "", "")
hi! link cssAttr Keyword
hi! link cssBraces Delimiter
hi! link cssClassName cssDefinition
hi! link cssColor Number
hi! link cssProp cssDefinition
hi! link cssPseudoClass cssDefinition
hi! link cssPseudoClassId cssPseudoClass
hi! link cssVendor Keyword

call s:hi("dosiniHeader", s:nord8_gui, "", s:nord8_term, "", "", "")
hi! link dosiniLabel Type

call s:hi("dtBooleanKey", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("dtExecKey", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("dtLocaleKey", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("dtNumericKey", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("dtTypeKey", s:nord7_gui, "", s:nord7_term, "", "", "")
hi! link dtDelim Delimiter
hi! link dtLocaleValue Keyword
hi! link dtTypeValue Keyword

call s:hi("DiffAdd", s:nord14_gui, s:nord1_gui, s:nord14_term, s:nord1_term, "", "")
call s:hi("DiffChange", s:nord13_gui, s:nord1_gui, s:nord13_term, s:nord1_term, "", "")
call s:hi("DiffDelete", s:nord11_gui, s:nord1_gui, s:nord11_term, s:nord1_term, "", "")
call s:hi("DiffText", s:nord9_gui, s:nord1_gui, s:nord9_term, s:nord1_term, "", "")

" Legacy groups for official git.vim and diff.vim syntax
hi! link diffAdded DiffAdd
hi! link diffChanged DiffChange
hi! link diffRemoved DiffDelete

call s:hi("gitconfigVariable", s:nord7_gui, "", s:nord7_term, "", "", "")

call s:hi("goBuiltins", s:nord7_gui, "", s:nord7_term, "", "", "")
hi! link goConstants Keyword

call s:hi("helpBar", s:nord3_gui, "", s:nord3_term, "", "", "")
call s:hi("helpHyperTextJump", s:nord8_gui, "", s:nord8_term, "", s:underline, "")

call s:hi("htmlArg", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("htmlLink", s:nord4_gui, "", "", "", "NONE", "NONE")
hi! link htmlBold Bold
hi! link htmlEndTag htmlTag
hi! link htmlItalic Italic
hi! link htmlH1 markdownH1
hi! link htmlH2 markdownH1
hi! link htmlH3 markdownH1
hi! link htmlH4 markdownH1
hi! link htmlH5 markdownH1
hi! link htmlH6 markdownH1
hi! link htmlSpecialChar SpecialChar
hi! link htmlTag Keyword
hi! link htmlTagN htmlTag

call s:hi("javaDocTags", s:nord7_gui, "", s:nord7_term, "", "", "")
hi! link javaCommentTitle Comment
hi! link javaScriptBraces Delimiter
hi! link javaScriptIdentifier Keyword
hi! link javaScriptNumber Number

call s:hi("jsonKeyword", s:nord7_gui, "", s:nord7_term, "", "", "")

call s:hi("lessClass", s:nord7_gui, "", s:nord7_term, "", "", "")
hi! link lessAmpersand Keyword
hi! link lessCssAttribute Delimiter
hi! link lessFunction Function
hi! link cssSelectorOp Keyword

hi! link lispAtomBarSymbol SpecialChar
hi! link lispAtomList SpecialChar
hi! link lispAtomMark Keyword
hi! link lispBarSymbol SpecialChar
hi! link lispFunc Function

hi! link luaFunc Function

call s:hi("markdownBlockquote", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("markdownCode", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("markdownCodeDelimiter", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("markdownFootnote", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("markdownId", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("markdownIdDeclaration", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("markdownH1", s:nord8_gui, "", s:nord8_term, "", "", "")
call s:hi("markdownLinkText", s:nord8_gui, "", s:nord8_term, "", "", "")
call s:hi("markdownUrl", s:nord4_gui, "", "NONE", "", "NONE", "")
hi! link markdownBold Bold
hi! link markdownBoldDelimiter Keyword
hi! link markdownFootnoteDefinition markdownFootnote
hi! link markdownH2 markdownH1
hi! link markdownH3 markdownH1
hi! link markdownH4 markdownH1
hi! link markdownH5 markdownH1
hi! link markdownH6 markdownH1
hi! link markdownIdDelimiter Keyword
hi! link markdownItalic Italic
hi! link markdownItalicDelimiter Keyword
hi! link markdownLinkDelimiter Keyword
hi! link markdownLinkTextDelimiter Keyword
hi! link markdownListMarker Keyword
hi! link markdownRule Keyword
hi! link markdownHeadingDelimiter Keyword

call s:hi("perlPackageDecl", s:nord7_gui, "", s:nord7_term, "", "", "")

call s:hi("phpClasses", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("phpDocTags", s:nord7_gui, "", s:nord7_term, "", "", "")
hi! link phpDocCustomTags phpDocTags
hi! link phpMemberSelector Keyword

call s:hi("podCmdText", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("podVerbatimLine", s:nord4_gui, "", "NONE", "", "", "")
hi! link podFormat Keyword

hi! link pythonBuiltin Type
hi! link pythonEscape SpecialChar

call s:hi("rubyConstant", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("rubySymbol", s:nord6_gui, "", s:nord6_term, "", s:bold, "")
hi! link rubyAttribute Identifier
hi! link rubyBlockParameterList Operator
hi! link rubyInterpolationDelimiter Keyword
hi! link rubyKeywordAsMethod Function
hi! link rubyLocalVariableOrMethod Function
hi! link rubyPseudoVariable Keyword
hi! link rubyRegexp SpecialChar

call s:hi("rustAttribute", s:nord10_gui, "", s:nord10_term, "", "", "")
call s:hi("rustEnum", s:nord7_gui, "", s:nord7_term, "", s:bold, "")
call s:hi("rustMacro", s:nord8_gui, "", s:nord8_term, "", s:bold, "")
call s:hi("rustModPath", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("rustPanic", s:nord9_gui, "", s:nord9_term, "", s:bold, "")
call s:hi("rustTrait", s:nord7_gui, "", s:nord7_term, "", s:italic, "")
hi! link rustCommentLineDoc Comment
hi! link rustDerive rustAttribute
hi! link rustEnumVariant rustEnum
hi! link rustEscape SpecialChar
hi! link rustQuestionMark Keyword

call s:hi("sassClass", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("sassId", s:nord7_gui, "", s:nord7_term, "", s:underline, "")
hi! link sassAmpersand Keyword
hi! link sassClassChar Delimiter
hi! link sassControl Keyword
hi! link sassControlLine Keyword
hi! link sassExtend Keyword
hi! link sassFor Keyword
hi! link sassFunctionDecl Keyword
hi! link sassFunctionName Function
hi! link sassidChar sassId
hi! link sassInclude Include
hi! link sassMixinName Function
hi! link sassMixing Include
hi! link sassReturn Keyword

hi! link shCmdParenRegion Delimiter
hi! link shCmdSubRegion Delimiter
hi! link shDerefSimple Identifier
hi! link shDerefVar Identifier

hi! link sqlKeyword Keyword
hi! link sqlSpecial Keyword

call s:hi("vimAugroup", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("vimMapRhs", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("vimNotation", s:nord7_gui, "", s:nord7_term, "", "", "")
hi! link vimFunc Function
hi! link vimFunction Function
hi! link vimUserFunc Function

" call s:hi("xmlAttrib", s:nord7_gui, "", s:nord7_term, "", "", "")
" call s:hi("xmlNamespace", s:nord7_gui, "", s:nord7_term, "", "", "")
" call s:hi("xmlCdataStart", s:nord3_gui_bright, "", s:nord3_term, "", s:bold, "")
call s:hi("xmlTag", s:nord9_gui, "", s:nord9_term, "", "", "")
hi! link xmlCdata Comment
hi link xmlTagName xmlTag
hi link xmlEndTag xmlTag
hi link xmlAttrib xmlTag

call s:hi("yamlBlockMappingKey", s:nord7_gui, "", s:nord7_term, "", "", "")
hi! link yamlBool Keyword
hi! link yamlDocumentStart Keyword

"+----------------+
"+ Plugin Support +
"+----------------+
"+--- UI ---+
" ALE
" > w0rp/ale
call s:hi("ALEWarningSign", s:nord13_gui, "", s:nord13_term, "", "", "")
call s:hi("ALEErrorSign" , s:nord11_gui, "", s:nord11_term, "", "", "")
call s:hi("ALEWarning" , s:nord13_gui, "", s:nord13_term, "", "undercurl", "")
call s:hi("ALEError" , s:nord11_gui, "", s:nord11_term, "", "undercurl", "")

" GitGutter
" > airblade/vim-gitgutter
call s:hi("GitGutterAdd", s:nord14_gui, "", s:nord14_term, "", "", "")
call s:hi("GitGutterChange", s:nord13_gui, "", s:nord13_term, "", "", "")
call s:hi("GitGutterChangeDelete", s:nord11_gui, "", s:nord11_term, "", "", "")
call s:hi("GitGutterDelete", s:nord11_gui, "", s:nord11_term, "", "", "")

" fugitive.vim
" > tpope/vim-fugitive
call s:hi("gitcommitDiscardedFile", s:nord11_gui, "", s:nord11_term, "", "", "")
call s:hi("gitcommitUntrackedFile", s:nord11_gui, "", s:nord11_term, "", "", "")
call s:hi("gitcommitSelectedFile", s:nord14_gui, "", s:nord14_term, "", "", "")

" vim-plug
" > junegunn/vim-plug
call s:hi("plugDeleted", s:nord11_gui, "", "", s:nord11_term, "", "")

"+--- Languages ---+
" Haskell
" > neovimhaskell/haskell-vim
call s:hi("haskellPreProc", s:nord10_gui, "", s:nord10_term, "", "", "")
call s:hi("haskellType", s:nord7_gui, "", s:nord7_term, "", "", "")
hi! link haskellPragma haskellPreProc

" JavaScript
" > pangloss/vim-javascript
call s:hi("jsGlobalNodeObjects", s:nord8_gui, "", s:nord8_term, "", s:italic, "")
hi! link jsBrackets Delimiter
hi! link jsFuncCall Function
hi! link jsFunction Function
hi! link jsFuncParens Delimiter
hi! link jsThis Keyword
hi! link jsNoise Delimiter
hi! link jsPrototype Keyword
hi! link jsRegexpString SpecialChar
hi! link StorageClass Function

" Markdown
" > plasticboy/vim-markdown
call s:hi("mkdCode", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("mkdFootnote", s:nord8_gui, "", s:nord8_term, "", "", "")
call s:hi("mkdRule", s:nord10_gui, "", s:nord10_term, "", "", "")
call s:hi("mkdLineBreak", s:nord9_gui, "", s:nord9_term, "", "", "")
hi! link mkdBold Bold
hi! link mkdItalic Italic
hi! link mkdString Keyword
hi! link mkdCodeStart mkdCode
hi! link mkdCodeEnd mkdCode
hi! link mkdBlockquote Comment
hi! link mkdListItem Keyword
hi! link mkdListItemLine Normal
hi! link mkdFootnotes mkdFootnote
hi! link mkdLink markdownLinkText
hi! link mkdURL markdownUrl
hi! link mkdInlineURL mkdURL
hi! link mkdID Identifier
hi! link mkdLinkDef mkdLink
hi! link mkdLinkDefTarget mkdURL
hi! link mkdLinkTitle mkdInlineURL
hi! link mkdDelimiter Keyword

" Vimwiki
" > vimwiki/vimwiki
if !exists("g:vimwiki_hl_headers") || g:vimwiki_hl_headers == 0
  for s:i in range(1,6)
    call s:hi("VimwikiHeader".s:i, s:nord8_gui, "", s:nord8_term, "", s:bold, "")
  endfor
else
  let s:vimwiki_hcolor_guifg = [s:nord7_gui, s:nord8_gui, s:nord9_gui, s:nord10_gui, s:nord14_gui, s:nord15_gui]
  let s:vimwiki_hcolor_ctermfg = [s:nord7_term, s:nord8_term, s:nord9_term, s:nord10_term, s:nord14_term, s:nord15_term]
  for s:i in range(1,6)
    call s:hi("VimwikiHeader".s:i, s:vimwiki_hcolor_guifg[s:i-1] , "", s:vimwiki_hcolor_ctermfg[s:i-1], "", s:bold, "")
  endfor
endif

call s:hi("VimwikiLink", s:nord8_gui, "", s:nord8_term, "", s:underline, "")
hi! link VimwikiHeaderChar markdownHeadingDelimiter
hi! link VimwikiHR Keyword
hi! link VimwikiList markdownListMarker

" YAML
" > stephpy/vim-yaml
call s:hi("yamlKey", s:nord7_gui, "", s:nord7_term, "", "", "")
