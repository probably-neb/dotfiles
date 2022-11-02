-- base16-nvim (https://github.com/wincent/base16-nvim)
-- by Greg Hurrell (https://github.com/wincent)
-- based on
-- base16-vim (https://github.com/chriskempson/base16-vim)
-- by Chris Kempson (https://github.com/chriskempson)
-- rusty scheme by Ben Kunkle

Base00 = "#27221f"
Base01 = "#392f29"
Base02 = "#3b3632"
Base03 = "#726853"
Base04 = "#bd8965"
Base05 = "#c89876"
Base06 = "#c26d30"
Base07 = "#726853"
Base08 = "#d4644c"
Base09 = "#a2c2b6"
Base0A = "#74a390"
Base0B = "#ffc45d"
Base0C = "#d4644c"
Base0D = "#95a6b8"
Base0E = "#e76f1a"
Base0F = "#fee1af"

local colors = {
   base00 = Base00,
   base01 = Base01,
   base02 = Base02, 
   base03 = Base03,
   base04 = Base04,
   base05 = Base05,
   base06 = Base06,
   base07 = Base07,
   base08 = Base08,
   base09 = Base09,
   base0A = Base0A,
   base0B = Base0B,
   base0C = Base0C,
   base0D = Base0D,
   base0E = Base0E,
   base0F = Base0F,
   }

vim.g.colors = colors

local cterm00 = 0
local cterm03 = 8
local cterm05 = 7
local cterm07 = 15
local cterm08 = 1
local cterm0A = 3
local cterm0B = 2
local cterm0C = 6
local cterm0D = 4
local cterm0E = 5
local cterm01 = 10
local cterm02 = 11
local cterm04 = 12
local cterm06 = 13
local cterm09 = 9
local cterm0F = 14

vim.cmd [[
  highlight clear
  syntax reset
]]
vim.g.colors_name = "base16-october"

-- Vim editor colors                    fg bg ctermfg ctermbg attr Basesp
vim.api.nvim_set_hl(0, 'Normal', { fg = Base05, bg = Base00, ctermfg = cterm05, ctermbg = cterm00 })
vim.api.nvim_set_hl(0, 'Bold', { bold = true })
vim.api.nvim_set_hl(0, 'Debug', { fg = Base08, ctermfg = cterm08 })
vim.api.nvim_set_hl(0, 'Directory', { fg = Base0D, ctermfg = cterm0D })
vim.api.nvim_set_hl(0, 'Error', { fg = Base00, bg = Base08, ctermfg = cterm00, ctermbg = cterm08 })
vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = Base08, bg = Base00, ctermfg = cterm08, ctermbg = cterm00 })
vim.api.nvim_set_hl(0, 'Exception', { fg = Base08, ctermfg = cterm08 })
vim.api.nvim_set_hl(0, 'FoldColumn', { fg = Base0C, bg = Base01, ctermfg = cterm0C, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'Folded', { fg = Base03, bg = Base01, ctermfg = cterm03, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'IncSearch', { fg = Base01, bg = Base09, ctermfg = cterm01, ctermbg = cterm09 })
vim.api.nvim_set_hl(0, 'Italic', {})
vim.api.nvim_set_hl(0, 'Macro', { fg = Base08, ctermfg = cterm08 })
vim.api.nvim_set_hl(0, 'MatchParen', { bg = Base03, ctermbg = cterm03 })
vim.api.nvim_set_hl(0, 'ModeMsg', { fg = Base0B, ctermfg = cterm0B })
vim.api.nvim_set_hl(0, 'MoreMsg', { fg = Base0B, ctermfg = cterm0B })
vim.api.nvim_set_hl(0, 'Question', { fg = Base0D, ctermfg = cterm0D })
vim.api.nvim_set_hl(0, 'Search', { fg = Base01, bg = Base0A, ctermfg = cterm01, ctermbg = cterm0A })
vim.api.nvim_set_hl(0, 'Substitute', { fg = Base01, bg = Base0A, ctermfg = cterm01, ctermbg = cterm0A })
vim.api.nvim_set_hl(0, 'SpecialKey', { fg = Base03, ctermfg = cterm03 })
vim.api.nvim_set_hl(0, 'TooLong', { fg = Base08, ctermfg = cterm08 })
vim.api.nvim_set_hl(0, 'Underlined', { fg = Base08, ctermfg = cterm08 })
vim.api.nvim_set_hl(0, 'Visual', { bg = Base02, ctermbg = cterm02 })
vim.api.nvim_set_hl(0, 'VisualNOS', { fg = Base08, ctermfg = cterm08 })
vim.api.nvim_set_hl(0, 'WarningMsg', { fg = Base08, ctermfg = cterm08 })
vim.api.nvim_set_hl(0, 'WildMenu', { fg = Base08, bg = Base0A, ctermfg = cterm08 })
vim.api.nvim_set_hl(0, 'Title', { fg = Base0D, ctermfg = cterm0D })
vim.api.nvim_set_hl(0, 'Conceal', { fg = Base0D, bg = Base00, ctermfg = cterm0D, ctermbg = cterm00 })
vim.api.nvim_set_hl(0, 'Cursor', { fg = Base00, bg = Base05, ctermfg = cterm00, ctermbg = cterm05 })
vim.api.nvim_set_hl(0, 'NonText', { fg = Base03, ctermfg = cterm03 })
vim.api.nvim_set_hl(0, 'LineNr', { fg = Base03, bg = Base01, ctermfg = cterm03, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'SignColumn', { fg = Base03, bg = Base01, ctermfg = cterm03, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'StatusLine', { fg = Base04, bg = Base02, ctermfg = cterm04, ctermbg = cterm02 })
vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = Base03, bg = Base01, ctermfg = cterm03, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'VertSplit', { fg = Base02, bg = Base02, ctermfg = cterm02, ctermbg = cterm02 })
vim.api.nvim_set_hl(0, 'ColorColumn', { bg = Base01, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'CursorColumn', { bg = Base01, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = Base01, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = Base04, bg = Base01, ctermfg = cterm04, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'QuickFixLine', { bg = Base01, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'PMenu', { fg = Base05, bg = Base01, ctermfg = cterm05, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'PMenuSel', { fg = Base01, bg = Base05, ctermfg = cterm01, ctermbg = cterm05 })
vim.api.nvim_set_hl(0, 'TabLine', { fg = Base03, bg = Base01, ctermfg = cterm03, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'TabLineFill', { fg = Base03, bg = Base01, ctermfg = cterm03, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'TabLineSel', { fg = Base0B, bg = Base01, ctermfg = cterm0B, ctermbg = cterm01 })

-- Standard syntax highlighting
vim.api.nvim_set_hl(0, 'Boolean', { fg = Base09, ctermfg = cterm09 })
vim.api.nvim_set_hl(0, 'Character', { fg = Base08, ctermfg = cterm08 })
vim.api.nvim_set_hl(0, 'Comment', { fg = Base03, ctermfg = cterm03 })
vim.api.nvim_set_hl(0, 'Conditional', { fg = Base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'Constant', { fg = Base09, ctermfg = cterm09 })
vim.api.nvim_set_hl(0, 'Define', { fg = Base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'Delimiter', { fg = Base0F, ctermfg = cterm0F })
vim.api.nvim_set_hl(0, 'Float', { fg = Base09, ctermfg = cterm09 })
vim.api.nvim_set_hl(0, 'Function', { fg = Base0D, ctermfg = cterm0D })
vim.api.nvim_set_hl(0, 'Identifier', { fg = Base08, ctermfg = cterm08 })
vim.api.nvim_set_hl(0, 'Include', { fg = Base0D, ctermfg = cterm0D })
vim.api.nvim_set_hl(0, 'Keyword', { fg = Base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'Label', { fg = Base0A, ctermfg = cterm0A })
vim.api.nvim_set_hl(0, 'Number', { fg = Base09, ctermfg = cterm09 })
vim.api.nvim_set_hl(0, 'Operator', { fg = Base05, ctermfg = cterm05 })
vim.api.nvim_set_hl(0, 'PreProc', { fg = Base0A, ctermfg = cterm0A })
vim.api.nvim_set_hl(0, 'Repeat', { fg = Base0A, ctermfg = cterm0A })
vim.api.nvim_set_hl(0, 'Special', { fg = Base0C, ctermfg = cterm0C })
vim.api.nvim_set_hl(0, 'SpecialChar', { fg = Base0F, ctermfg = cterm0F })
vim.api.nvim_set_hl(0, 'Statement', { fg = Base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'StorageClass', { fg = Base0A, ctermfg = cterm0A })
vim.api.nvim_set_hl(0, 'String', { fg = Base0B, ctermfg = cterm0B })
vim.api.nvim_set_hl(0, 'Structure', { fg = Base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'Tag', { fg = Base0A, ctermfg = cterm0A })
vim.api.nvim_set_hl(0, 'Todo', { fg = Base0A, bg = Base01, ctermfg = cterm0A, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'Type', { fg = Base0A, ctermfg = cterm0A })
vim.api.nvim_set_hl(0, 'Typedef', { fg = Base0A, ctermfg = cterm0A })

-- C highlighting
vim.api.nvim_set_hl(0, 'cOperator', { fg = Base0C, ctermfg = cterm0C })
vim.api.nvim_set_hl(0, 'cPreCondit', { fg = Base0E, ctermfg = cterm0E })

-- C# highlighting
vim.api.nvim_set_hl(0, 'csClass', { fg = Base0A, ctermfg = cterm0A })
vim.api.nvim_set_hl(0, 'csAttribute', { fg = Base0A, ctermfg = cterm0A })
vim.api.nvim_set_hl(0, 'csModifier', { fg = Base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'csType', { fg = Base08, ctermfg = cterm08 })
vim.api.nvim_set_hl(0, 'csUnspecifiedStatement', { fg = Base0D, ctermfg = cterm0D })
vim.api.nvim_set_hl(0, 'csContextualStatement', { fg = Base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'csNewDecleration', { fg = Base08, ctermfg = cterm08 })

-- CSS highlighting
vim.api.nvim_set_hl(0, 'cssBraces', { fg = Base05, ctermfg = cterm05 })
vim.api.nvim_set_hl(0, 'cssClassName', { fg = Base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'cssColor', { fg = Base0C, ctermfg = cterm0C })

-- Diff highlighting
vim.api.nvim_set_hl(0, 'DiffAdd', { fg = Base0B, bg = Base01, ctermfg =  cterm0B, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'DiffChange', { fg = Base03, bg = Base01, ctermfg =  cterm03, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'DiffDelete', { fg = Base08, bg = Base01, ctermfg =  cterm08, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'DiffText', { fg = Base0D, bg = Base01, ctermfg =  cterm0D, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'DiffAdded', { fg = Base0B, bg = Base00, ctermfg =  cterm0B, ctermbg = cterm00 })
vim.api.nvim_set_hl(0, 'DiffFile', { fg = Base08, bg = Base00, ctermfg =  cterm08, ctermbg = cterm00 })
vim.api.nvim_set_hl(0, 'DiffNewFile', { fg = Base0B, bg = Base00, ctermfg =  cterm0B, ctermbg = cterm00 })
vim.api.nvim_set_hl(0, 'DiffLine', { fg = Base0D, bg = Base00, ctermfg =  cterm0D, ctermbg = cterm00 })
vim.api.nvim_set_hl(0, 'DiffRemoved', { fg = Base08, bg = Base00, ctermfg =  cterm08, ctermbg = cterm00 })

-- Git highlighting
vim.api.nvim_set_hl(0, 'gitcommitOverflow', { fg = Base08, ctermfg = cterm08 })
vim.api.nvim_set_hl(0, 'gitcommitSummary', { fg = Base0B, ctermfg = cterm0B })
vim.api.nvim_set_hl(0, 'gitcommitComment', { fg = Base03, ctermfg = cterm03 })
vim.api.nvim_set_hl(0, 'gitcommitUntracked', { fg = Base03, ctermfg = cterm03 })
vim.api.nvim_set_hl(0, 'gitcommitDiscarded', { fg = Base03, ctermfg = cterm03 })
vim.api.nvim_set_hl(0, 'gitcommitSelected', { fg = Base03, ctermfg = cterm03 })
vim.api.nvim_set_hl(0, 'gitcommitHeader', { fg = Base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'gitcommitSelectedType', { fg = Base0D, ctermfg = cterm0D })
vim.api.nvim_set_hl(0, 'gitcommitUnmergedType', { fg = Base0D, ctermfg = cterm0D })
vim.api.nvim_set_hl(0, 'gitcommitDiscardedType', { fg = Base0D, ctermfg = cterm0D })
vim.api.nvim_set_hl(0, 'gitcommitBranch', { fg = Base09, ctermfg = cterm09, bold = true })
vim.api.nvim_set_hl(0, 'gitcommitUntrackedFile', { fg = Base0A, ctermfg = cterm0A })
vim.api.nvim_set_hl(0, 'gitcommitUnmergedFile', { fg = Base08, ctermfg = cterm08, bold = true })
vim.api.nvim_set_hl(0, 'gitcommitDiscardedFile', { fg = Base08, ctermfg = cterm08, bold = true })
vim.api.nvim_set_hl(0, 'gitcommitSelectedFile', { fg = Base0B, ctermfg = cterm0B, bold = true })

-- GitGutter highlighting
vim.api.nvim_set_hl(0, 'GitGutterAdd', { fg = Base0B, bg = Base01, ctermfg = cterm0B, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'GitGutterChange', { fg = Base0D, bg = Base01, ctermfg = cterm0D, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'GitGutterDelete', { fg = Base08, bg = Base01, ctermfg = cterm08, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'GitGutterChangeDelete', { fg = Base0E, bg = Base01, ctermfg = cterm0E, ctermbg = cterm01 })

-- HTML highlighting
vim.api.nvim_set_hl(0, 'htmlBold', { fg = Base0A, ctermfg = cterm0A })
vim.api.nvim_set_hl(0, 'htmlItalic', { fg = Base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'htmlEndTag', { fg = Base05, ctermfg = cterm05 })
vim.api.nvim_set_hl(0, 'htmlTag', { fg = Base05, ctermfg = cterm05 })

-- JavaScript highlighting
vim.api.nvim_set_hl(0, 'javaScript', { fg = Base05, ctermfg = cterm05 })
vim.api.nvim_set_hl(0, 'javaScriptBraces', { fg = Base05, ctermfg = cterm05 })
vim.api.nvim_set_hl(0, 'javaScriptNumber', { fg = Base09, ctermfg = cterm09 })

-- pangloss/vim-javascript highlighting
vim.api.nvim_set_hl(0, 'jsOperator', { fg = Base0D, ctermfg = cterm0D })
vim.api.nvim_set_hl(0, 'jsStatement', { fg = Base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'jsReturn', { fg = Base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'jsThis', { fg = Base08, ctermfg = cterm08 })
vim.api.nvim_set_hl(0, 'jsClassDefinition', { fg = Base0A, ctermfg = cterm0A })
vim.api.nvim_set_hl(0, 'jsFunction', { fg = Base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'jsFuncName', { fg = Base0D, ctermfg = cterm0D })
vim.api.nvim_set_hl(0, 'jsFuncCall', { fg = Base0D, ctermfg = cterm0D })
vim.api.nvim_set_hl(0, 'jsClassFuncName', { fg = Base0D, ctermfg = cterm0D })
vim.api.nvim_set_hl(0, 'jsClassMethodType', { fg = Base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'jsRegexpString', { fg = Base0C, ctermfg = cterm0C })
vim.api.nvim_set_hl(0, 'jsGlobalObjects', { fg = Base0A, ctermfg = cterm0A })
vim.api.nvim_set_hl(0, 'jsGlobalNodeObjects', { fg = Base0A, ctermfg = cterm0A })
vim.api.nvim_set_hl(0, 'jsExceptions', { fg = Base0A, ctermfg = cterm0A })
vim.api.nvim_set_hl(0, 'jsBuiltins', { fg = Base0A, ctermfg = cterm0A })

-- LSP highlighting
vim.api.nvim_set_hl(0, 'LspDiagnosticsDefaultError', { fg = Base08, ctermfg = cterm08 })
vim.api.nvim_set_hl(0, 'LspDiagnosticsDefaultWarning', { fg = Base09, ctermfg = cterm09 })
vim.api.nvim_set_hl(0, 'LspDiagnosticsDefaultHnformation', { fg = Base05, ctermfg = cterm05 })
vim.api.nvim_set_hl(0, 'LspDiagnosticsDefaultHint', { fg = Base03, ctermfg = cterm03 })

-- Mail highlighting
vim.api.nvim_set_hl(0, 'mailQuoted1', { fg = Base0A, ctermfg = cterm0A })
vim.api.nvim_set_hl(0, 'mailQuoted2', { fg = Base0B, ctermfg = cterm0B })
vim.api.nvim_set_hl(0, 'mailQuoted3', { fg = Base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'mailQuoted4', { fg = Base0C, ctermfg = cterm0C })
vim.api.nvim_set_hl(0, 'mailQuoted5', { fg = Base0D, ctermfg = cterm0D })
vim.api.nvim_set_hl(0, 'mailQuoted6', { fg = Base0A, ctermfg = cterm0A })
vim.api.nvim_set_hl(0, 'mailURL', { fg = Base0D, ctermfg = cterm0D })
vim.api.nvim_set_hl(0, 'mailEmail', { fg = Base0D, ctermfg = cterm0D })

-- Markdown highlighting
vim.api.nvim_set_hl(0, 'markdownCode', { fg = Base0B, ctermfg = cterm0B })
vim.api.nvim_set_hl(0, 'markdownError', { fg = Base05, bg = Base00, ctermfg = cterm05, ctermbg = cterm00 })
vim.api.nvim_set_hl(0, 'markdownCodeBlock', { fg = Base0B, ctermfg = cterm0B })
vim.api.nvim_set_hl(0, 'markdownHeadingDelimiter', { fg = Base0D, ctermfg = cterm0D })

-- NERDTree highlighting
vim.api.nvim_set_hl(0, 'NERDTreeDirSlash', { fg = Base0D, ctermfg = cterm0D })
vim.api.nvim_set_hl(0, 'NERDTreeExecFile', { fg = Base05, ctermfg = cterm05 })

-- PHP highlighting
vim.api.nvim_set_hl(0, 'phpMemberSelector', { fg = Base05, ctermfg = cterm05 })
vim.api.nvim_set_hl(0, 'phpComparison', { fg = Base05, ctermfg = cterm05 })
vim.api.nvim_set_hl(0, 'phpParent', { fg = Base05, ctermfg = cterm05 })
vim.api.nvim_set_hl(0, 'phpMethodsVar', { fg = Base0C, ctermfg = cterm0C })

-- Python highlighting
vim.api.nvim_set_hl(0, 'pythonOperator', { fg = Base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'pythonRepeat', { fg = Base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'pythonInclude', { fg = Base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'pythonStatement', { fg = Base0E, ctermfg = cterm0E })

-- Ruby highlighting
vim.api.nvim_set_hl(0, 'rubyAttribute', { fg = Base0D, ctermfg = cterm0D })
vim.api.nvim_set_hl(0, 'rubyConstant', { fg = Base0A, ctermfg = cterm0A })
vim.api.nvim_set_hl(0, 'rubyInterpolationDelimiter', { fg = Base0F, ctermfg = cterm0F })
vim.api.nvim_set_hl(0, 'rubyRegexp', { fg = Base0C, ctermfg = cterm0C })
vim.api.nvim_set_hl(0, 'rubySymbol', { fg = Base0B, ctermfg = cterm0B })
vim.api.nvim_set_hl(0, 'rubyStringDelimiter', { fg = Base0B, ctermfg = cterm0B })

-- SASS highlighting
vim.api.nvim_set_hl(0, 'sassidChar', { fg = Base08, ctermfg = cterm08 })
vim.api.nvim_set_hl(0, 'sassClassChar', { fg = Base09, ctermfg = cterm09 })
vim.api.nvim_set_hl(0, 'sassInclude', { fg = Base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'sassMixing', { fg = Base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'sassMixinName', { fg = Base0D, ctermfg = cterm0D })

-- Signify highlighting
vim.api.nvim_set_hl(0, 'SignifySignAdd', { fg = Base0B, bg = Base01, ctermfg = cterm0B, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'SignifySignChange', { fg = Base0D, bg = Base01, ctermfg = cterm0D, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'SignifySignDelete', { fg = Base08, bg = Base01, ctermfg = cterm08, ctermbg = cterm01 })

-- Spelling highlighting
vim.api.nvim_set_hl(0, 'SpellBad', { undercurl = true })
vim.api.nvim_set_hl(0, 'SpellLocal', { undercurl = true })
vim.api.nvim_set_hl(0, 'SpellCap', { undercurl = true })
vim.api.nvim_set_hl(0, 'SpellRare', { undercurl = true })

-- Startify highlighting
vim.api.nvim_set_hl(0, 'StartifyBracket', { fg = Base03, ctermfg = cterm03 })
vim.api.nvim_set_hl(0, 'StartifyFile', { fg = Base07, ctermfg = cterm07 })
vim.api.nvim_set_hl(0, 'StartifyFooter', { fg = Base03, ctermfg = cterm03 })
vim.api.nvim_set_hl(0, 'StartifyHeader', { fg = Base0B, ctermfg = cterm0B })
vim.api.nvim_set_hl(0, 'StartifyNumber', { fg = Base09, ctermfg = cterm09 })
vim.api.nvim_set_hl(0, 'StartifyPath', { fg = Base03, ctermfg = cterm03 })
vim.api.nvim_set_hl(0, 'StartifySection', { fg = Base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'StartifySelect', { fg = Base0C, ctermfg = cterm0C })
vim.api.nvim_set_hl(0, 'StartifySlash', { fg = Base03, ctermfg = cterm03 })
vim.api.nvim_set_hl(0, 'StartifySpecial', { fg = Base03, ctermfg = cterm03 })

-- Java highlighting
vim.api.nvim_set_hl(0, 'javaOperator', { fg = Base0D, ctermfg = cterm0D })

-- vim: filetype=lua
