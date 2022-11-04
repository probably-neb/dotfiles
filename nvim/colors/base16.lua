-- base16-nvim (https://github.com/wincent/base16-nvim)
-- by Greg Hurrell (https://github.com/wincent)
-- based on
-- base16-vim (https://github.com/chriskempson/base16-vim)
-- by Chris Kempson (https://github.com/chriskempson)
-- rusty scheme by Ben Kunkle

local base00 = "#27221f"
local base01 = "#392f29"
local base02 = "#3b3632"
local base03 = "#726853"
local base04 = "#bd8965"
local base05 = "#c89876"
local base06 = "#c26d30"
local base07 = "#726853"
local base08 = "#d4644c"
local base09 = "#a2c2b6"
local base0A = "#74a390"
local base0B = "#ffc45d"
local base0C = "#d4644c"
local base0D = "#95a6b8"
local base0E = "#e76f1a"
local base0F = "#fee1af"

vim.g.colors = {
   base00 = base00,
   base01 = base01,
   base02 = base02, 
   base03 = base03,
   base04 = base04,
   base05 = base05,
   base06 = base06,
   base07 = base07,
   base08 = base08,
   base09 = base09,
   base0A = base0A,
   base0B = base0B,
   base0C = base0C,
   base0D = base0D,
   base0E = base0E,
   base0F = base0F,
}

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

-- Vim editor colors                    fg bg ctermfg ctermbg attr basesp
vim.api.nvim_set_hl(0, 'Normal', { fg = base05, bg = base00, ctermfg = cterm05, ctermbg = cterm00 })
vim.api.nvim_set_hl(0, 'Bold', { bold = true })
vim.api.nvim_set_hl(0, 'Debug', { fg = base08, ctermfg = cterm08 })
vim.api.nvim_set_hl(0, 'Directory', { fg = base0D, ctermfg = cterm0D })
vim.api.nvim_set_hl(0, 'Error', { fg = base00, bg = base08, ctermfg = cterm00, ctermbg = cterm08 })
vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = base08, bg = base00, ctermfg = cterm08, ctermbg = cterm00 })
vim.api.nvim_set_hl(0, 'Exception', { fg = base08, ctermfg = cterm08 })
vim.api.nvim_set_hl(0, 'FoldColumn', { fg = base0C, bg = base01, ctermfg = cterm0C, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'Folded', { fg = base03, bg = base01, ctermfg = cterm03, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'IncSearch', { fg = base01, bg = base09, ctermfg = cterm01, ctermbg = cterm09 })
vim.api.nvim_set_hl(0, 'Italic', {})
vim.api.nvim_set_hl(0, 'Macro', { fg = base08, ctermfg = cterm08 })
vim.api.nvim_set_hl(0, 'MatchParen', { bg = base03, ctermbg = cterm03 })
vim.api.nvim_set_hl(0, 'ModeMsg', { fg = base0B, ctermfg = cterm0B })
vim.api.nvim_set_hl(0, 'MoreMsg', { fg = base0B, ctermfg = cterm0B })
vim.api.nvim_set_hl(0, 'Question', { fg = base0D, ctermfg = cterm0D })
vim.api.nvim_set_hl(0, 'Search', { fg = base01, bg = base0A, ctermfg = cterm01, ctermbg = cterm0A })
vim.api.nvim_set_hl(0, 'Substitute', { fg = base01, bg = base0A, ctermfg = cterm01, ctermbg = cterm0A })
vim.api.nvim_set_hl(0, 'SpecialKey', { fg = base03, ctermfg = cterm03 })
vim.api.nvim_set_hl(0, 'TooLong', { fg = base08, ctermfg = cterm08 })
vim.api.nvim_set_hl(0, 'Underlined', { fg = base08, ctermfg = cterm08 })
vim.api.nvim_set_hl(0, 'Visual', { bg = base02, ctermbg = cterm02 })
vim.api.nvim_set_hl(0, 'VisualNOS', { fg = base08, ctermfg = cterm08 })
vim.api.nvim_set_hl(0, 'WarningMsg', { fg = base08, ctermfg = cterm08 })
vim.api.nvim_set_hl(0, 'WildMenu', { fg = base08, bg = base0A, ctermfg = cterm08 })
vim.api.nvim_set_hl(0, 'Title', { fg = base0D, ctermfg = cterm0D })
vim.api.nvim_set_hl(0, 'Conceal', { fg = base0D, bg = base00, ctermfg = cterm0D, ctermbg = cterm00 })
vim.api.nvim_set_hl(0, 'Cursor', { fg = base00, bg = base05, ctermfg = cterm00, ctermbg = cterm05 })
vim.api.nvim_set_hl(0, 'NonText', { fg = base03, ctermfg = cterm03 })
vim.api.nvim_set_hl(0, 'LineNr', { fg = base03, bg = base01, ctermfg = cterm03, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'SignColumn', { fg = base03, bg = base01, ctermfg = cterm03, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'StatusLine', { fg = base04, bg = base02, ctermfg = cterm04, ctermbg = cterm02 })
vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = base03, bg = base01, ctermfg = cterm03, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'VertSplit', { fg = base02, bg = base02, ctermfg = cterm02, ctermbg = cterm02 })
vim.api.nvim_set_hl(0, 'ColorColumn', { bg = base01, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'CursorColumn', { bg = base01, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = base01, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = base04, bg = base01, ctermfg = cterm04, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'QuickFixLine', { bg = base01, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'PMenu', { fg = base05, bg = base01, ctermfg = cterm05, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'PMenuSel', { fg = base01, bg = base05, ctermfg = cterm01, ctermbg = cterm05 })
vim.api.nvim_set_hl(0, 'TabLine', { fg = base03, bg = base01, ctermfg = cterm03, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'TabLineFill', { fg = base03, bg = base01, ctermfg = cterm03, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'TabLineSel', { fg = base0B, bg = base01, ctermfg = cterm0B, ctermbg = cterm01 })

-- Standard syntax highlighting
vim.api.nvim_set_hl(0, 'Boolean', { fg = base09, ctermfg = cterm09 })
vim.api.nvim_set_hl(0, 'Character', { fg = base08, ctermfg = cterm08 })
vim.api.nvim_set_hl(0, 'Comment', { fg = base03, ctermfg = cterm03 })
vim.api.nvim_set_hl(0, 'Conditional', { fg = base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'Constant', { fg = base09, ctermfg = cterm09 })
vim.api.nvim_set_hl(0, 'Define', { fg = base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'Delimiter', { fg = base0F, ctermfg = cterm0F })
vim.api.nvim_set_hl(0, 'Float', { fg = base09, ctermfg = cterm09 })
vim.api.nvim_set_hl(0, 'Function', { fg = base0D, ctermfg = cterm0D })
vim.api.nvim_set_hl(0, 'Identifier', { fg = base08, ctermfg = cterm08 })
vim.api.nvim_set_hl(0, 'Include', { fg = base0D, ctermfg = cterm0D })
vim.api.nvim_set_hl(0, 'Keyword', { fg = base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'Label', { fg = base0A, ctermfg = cterm0A })
vim.api.nvim_set_hl(0, 'Number', { fg = base09, ctermfg = cterm09 })
vim.api.nvim_set_hl(0, 'Operator', { fg = base05, ctermfg = cterm05 })
vim.api.nvim_set_hl(0, 'PreProc', { fg = base0A, ctermfg = cterm0A })
vim.api.nvim_set_hl(0, 'Repeat', { fg = base0A, ctermfg = cterm0A })
vim.api.nvim_set_hl(0, 'Special', { fg = base0C, ctermfg = cterm0C })
vim.api.nvim_set_hl(0, 'SpecialChar', { fg = base0F, ctermfg = cterm0F })
vim.api.nvim_set_hl(0, 'Statement', { fg = base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'StorageClass', { fg = base0A, ctermfg = cterm0A })
vim.api.nvim_set_hl(0, 'String', { fg = base0B, ctermfg = cterm0B })
vim.api.nvim_set_hl(0, 'Structure', { fg = base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'Tag', { fg = base0A, ctermfg = cterm0A })
vim.api.nvim_set_hl(0, 'Todo', { fg = base0A, bg = base01, ctermfg = cterm0A, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'Type', { fg = base0A, ctermfg = cterm0A })
vim.api.nvim_set_hl(0, 'Typedef', { fg = base0A, ctermfg = cterm0A })

-- C highlighting
vim.api.nvim_set_hl(0, 'cOperator', { fg = base0C, ctermfg = cterm0C })
vim.api.nvim_set_hl(0, 'cPreCondit', { fg = base0E, ctermfg = cterm0E })

-- C# highlighting
vim.api.nvim_set_hl(0, 'csClass', { fg = base0A, ctermfg = cterm0A })
vim.api.nvim_set_hl(0, 'csAttribute', { fg = base0A, ctermfg = cterm0A })
vim.api.nvim_set_hl(0, 'csModifier', { fg = base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'csType', { fg = base08, ctermfg = cterm08 })
vim.api.nvim_set_hl(0, 'csUnspecifiedStatement', { fg = base0D, ctermfg = cterm0D })
vim.api.nvim_set_hl(0, 'csContextualStatement', { fg = base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'csNewDecleration', { fg = base08, ctermfg = cterm08 })

-- CSS highlighting
vim.api.nvim_set_hl(0, 'cssBraces', { fg = base05, ctermfg = cterm05 })
vim.api.nvim_set_hl(0, 'cssClassName', { fg = base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'cssColor', { fg = base0C, ctermfg = cterm0C })

-- Diff highlighting
vim.api.nvim_set_hl(0, 'DiffAdd', { fg = base0B, bg = base01, ctermfg =  cterm0B, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'DiffChange', { fg = base03, bg = base01, ctermfg =  cterm03, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'DiffDelete', { fg = base08, bg = base01, ctermfg =  cterm08, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'DiffText', { fg = base0D, bg = base01, ctermfg =  cterm0D, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'DiffAdded', { fg = base0B, bg = base00, ctermfg =  cterm0B, ctermbg = cterm00 })
vim.api.nvim_set_hl(0, 'DiffFile', { fg = base08, bg = base00, ctermfg =  cterm08, ctermbg = cterm00 })
vim.api.nvim_set_hl(0, 'DiffNewFile', { fg = base0B, bg = base00, ctermfg =  cterm0B, ctermbg = cterm00 })
vim.api.nvim_set_hl(0, 'DiffLine', { fg = base0D, bg = base00, ctermfg =  cterm0D, ctermbg = cterm00 })
vim.api.nvim_set_hl(0, 'DiffRemoved', { fg = base08, bg = base00, ctermfg =  cterm08, ctermbg = cterm00 })

-- Git highlighting
vim.api.nvim_set_hl(0, 'gitcommitOverflow', { fg = base08, ctermfg = cterm08 })
vim.api.nvim_set_hl(0, 'gitcommitSummary', { fg = base0B, ctermfg = cterm0B })
vim.api.nvim_set_hl(0, 'gitcommitComment', { fg = base03, ctermfg = cterm03 })
vim.api.nvim_set_hl(0, 'gitcommitUntracked', { fg = base03, ctermfg = cterm03 })
vim.api.nvim_set_hl(0, 'gitcommitDiscarded', { fg = base03, ctermfg = cterm03 })
vim.api.nvim_set_hl(0, 'gitcommitSelected', { fg = base03, ctermfg = cterm03 })
vim.api.nvim_set_hl(0, 'gitcommitHeader', { fg = base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'gitcommitSelectedType', { fg = base0D, ctermfg = cterm0D })
vim.api.nvim_set_hl(0, 'gitcommitUnmergedType', { fg = base0D, ctermfg = cterm0D })
vim.api.nvim_set_hl(0, 'gitcommitDiscardedType', { fg = base0D, ctermfg = cterm0D })
vim.api.nvim_set_hl(0, 'gitcommitBranch', { fg = base09, ctermfg = cterm09, bold = true })
vim.api.nvim_set_hl(0, 'gitcommitUntrackedFile', { fg = base0A, ctermfg = cterm0A })
vim.api.nvim_set_hl(0, 'gitcommitUnmergedFile', { fg = base08, ctermfg = cterm08, bold = true })
vim.api.nvim_set_hl(0, 'gitcommitDiscardedFile', { fg = base08, ctermfg = cterm08, bold = true })
vim.api.nvim_set_hl(0, 'gitcommitSelectedFile', { fg = base0B, ctermfg = cterm0B, bold = true })

-- GitGutter highlighting
vim.api.nvim_set_hl(0, 'GitGutterAdd', { fg = base0B, bg = base01, ctermfg = cterm0B, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'GitGutterChange', { fg = base0D, bg = base01, ctermfg = cterm0D, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'GitGutterDelete', { fg = base08, bg = base01, ctermfg = cterm08, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'GitGutterChangeDelete', { fg = base0E, bg = base01, ctermfg = cterm0E, ctermbg = cterm01 })

-- HTML highlighting
vim.api.nvim_set_hl(0, 'htmlBold', { fg = base0A, ctermfg = cterm0A })
vim.api.nvim_set_hl(0, 'htmlItalic', { fg = base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'htmlEndTag', { fg = base05, ctermfg = cterm05 })
vim.api.nvim_set_hl(0, 'htmlTag', { fg = base05, ctermfg = cterm05 })

-- JavaScript highlighting
vim.api.nvim_set_hl(0, 'javaScript', { fg = base05, ctermfg = cterm05 })
vim.api.nvim_set_hl(0, 'javaScriptBraces', { fg = base05, ctermfg = cterm05 })
vim.api.nvim_set_hl(0, 'javaScriptNumber', { fg = base09, ctermfg = cterm09 })

-- pangloss/vim-javascript highlighting
vim.api.nvim_set_hl(0, 'jsOperator', { fg = base0D, ctermfg = cterm0D })
vim.api.nvim_set_hl(0, 'jsStatement', { fg = base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'jsReturn', { fg = base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'jsThis', { fg = base08, ctermfg = cterm08 })
vim.api.nvim_set_hl(0, 'jsClassDefinition', { fg = base0A, ctermfg = cterm0A })
vim.api.nvim_set_hl(0, 'jsFunction', { fg = base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'jsFuncName', { fg = base0D, ctermfg = cterm0D })
vim.api.nvim_set_hl(0, 'jsFuncCall', { fg = base0D, ctermfg = cterm0D })
vim.api.nvim_set_hl(0, 'jsClassFuncName', { fg = base0D, ctermfg = cterm0D })
vim.api.nvim_set_hl(0, 'jsClassMethodType', { fg = base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'jsRegexpString', { fg = base0C, ctermfg = cterm0C })
vim.api.nvim_set_hl(0, 'jsGlobalObjects', { fg = base0A, ctermfg = cterm0A })
vim.api.nvim_set_hl(0, 'jsGlobalNodeObjects', { fg = base0A, ctermfg = cterm0A })
vim.api.nvim_set_hl(0, 'jsExceptions', { fg = base0A, ctermfg = cterm0A })
vim.api.nvim_set_hl(0, 'jsBuiltins', { fg = base0A, ctermfg = cterm0A })

-- LSP highlighting
vim.api.nvim_set_hl(0, 'LspDiagnosticsDefaultError', { fg = base08, ctermfg = cterm08 })
vim.api.nvim_set_hl(0, 'LspDiagnosticsDefaultWarning', { fg = base09, ctermfg = cterm09 })
vim.api.nvim_set_hl(0, 'LspDiagnosticsDefaultHnformation', { fg = base05, ctermfg = cterm05 })
vim.api.nvim_set_hl(0, 'LspDiagnosticsDefaultHint', { fg = base03, ctermfg = cterm03 })

-- Mail highlighting
vim.api.nvim_set_hl(0, 'mailQuoted1', { fg = base0A, ctermfg = cterm0A })
vim.api.nvim_set_hl(0, 'mailQuoted2', { fg = base0B, ctermfg = cterm0B })
vim.api.nvim_set_hl(0, 'mailQuoted3', { fg = base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'mailQuoted4', { fg = base0C, ctermfg = cterm0C })
vim.api.nvim_set_hl(0, 'mailQuoted5', { fg = base0D, ctermfg = cterm0D })
vim.api.nvim_set_hl(0, 'mailQuoted6', { fg = base0A, ctermfg = cterm0A })
vim.api.nvim_set_hl(0, 'mailURL', { fg = base0D, ctermfg = cterm0D })
vim.api.nvim_set_hl(0, 'mailEmail', { fg = base0D, ctermfg = cterm0D })

-- Markdown highlighting
vim.api.nvim_set_hl(0, 'markdownCode', { fg = base0B, ctermfg = cterm0B })
vim.api.nvim_set_hl(0, 'markdownError', { fg = base05, bg = base00, ctermfg = cterm05, ctermbg = cterm00 })
vim.api.nvim_set_hl(0, 'markdownCodeBlock', { fg = base0B, ctermfg = cterm0B })
vim.api.nvim_set_hl(0, 'markdownHeadingDelimiter', { fg = base0D, ctermfg = cterm0D })

-- NERDTree highlighting
vim.api.nvim_set_hl(0, 'NERDTreeDirSlash', { fg = base0D, ctermfg = cterm0D })
vim.api.nvim_set_hl(0, 'NERDTreeExecFile', { fg = base05, ctermfg = cterm05 })

-- PHP highlighting
vim.api.nvim_set_hl(0, 'phpMemberSelector', { fg = base05, ctermfg = cterm05 })
vim.api.nvim_set_hl(0, 'phpComparison', { fg = base05, ctermfg = cterm05 })
vim.api.nvim_set_hl(0, 'phpParent', { fg = base05, ctermfg = cterm05 })
vim.api.nvim_set_hl(0, 'phpMethodsVar', { fg = base0C, ctermfg = cterm0C })

-- Python highlighting
vim.api.nvim_set_hl(0, 'pythonOperator', { fg = base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'pythonRepeat', { fg = base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'pythonInclude', { fg = base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'pythonStatement', { fg = base0E, ctermfg = cterm0E })

-- Ruby highlighting
vim.api.nvim_set_hl(0, 'rubyAttribute', { fg = base0D, ctermfg = cterm0D })
vim.api.nvim_set_hl(0, 'rubyConstant', { fg = base0A, ctermfg = cterm0A })
vim.api.nvim_set_hl(0, 'rubyInterpolationDelimiter', { fg = base0F, ctermfg = cterm0F })
vim.api.nvim_set_hl(0, 'rubyRegexp', { fg = base0C, ctermfg = cterm0C })
vim.api.nvim_set_hl(0, 'rubySymbol', { fg = base0B, ctermfg = cterm0B })
vim.api.nvim_set_hl(0, 'rubyStringDelimiter', { fg = base0B, ctermfg = cterm0B })

-- SASS highlighting
vim.api.nvim_set_hl(0, 'sassidChar', { fg = base08, ctermfg = cterm08 })
vim.api.nvim_set_hl(0, 'sassClassChar', { fg = base09, ctermfg = cterm09 })
vim.api.nvim_set_hl(0, 'sassInclude', { fg = base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'sassMixing', { fg = base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'sassMixinName', { fg = base0D, ctermfg = cterm0D })

-- Signify highlighting
vim.api.nvim_set_hl(0, 'SignifySignAdd', { fg = base0B, bg = base01, ctermfg = cterm0B, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'SignifySignChange', { fg = base0D, bg = base01, ctermfg = cterm0D, ctermbg = cterm01 })
vim.api.nvim_set_hl(0, 'SignifySignDelete', { fg = base08, bg = base01, ctermfg = cterm08, ctermbg = cterm01 })

-- Spelling highlighting
vim.api.nvim_set_hl(0, 'SpellBad', { undercurl = true })
vim.api.nvim_set_hl(0, 'SpellLocal', { undercurl = true })
vim.api.nvim_set_hl(0, 'SpellCap', { undercurl = true })
vim.api.nvim_set_hl(0, 'SpellRare', { undercurl = true })

-- Startify highlighting
vim.api.nvim_set_hl(0, 'StartifyBracket', { fg = base03, ctermfg = cterm03 })
vim.api.nvim_set_hl(0, 'StartifyFile', { fg = base07, ctermfg = cterm07 })
vim.api.nvim_set_hl(0, 'StartifyFooter', { fg = base03, ctermfg = cterm03 })
vim.api.nvim_set_hl(0, 'StartifyHeader', { fg = base0B, ctermfg = cterm0B })
vim.api.nvim_set_hl(0, 'StartifyNumber', { fg = base09, ctermfg = cterm09 })
vim.api.nvim_set_hl(0, 'StartifyPath', { fg = base03, ctermfg = cterm03 })
vim.api.nvim_set_hl(0, 'StartifySection', { fg = base0E, ctermfg = cterm0E })
vim.api.nvim_set_hl(0, 'StartifySelect', { fg = base0C, ctermfg = cterm0C })
vim.api.nvim_set_hl(0, 'StartifySlash', { fg = base03, ctermfg = cterm03 })
vim.api.nvim_set_hl(0, 'StartifySpecial', { fg = base03, ctermfg = cterm03 })

-- Java highlighting
vim.api.nvim_set_hl(0, 'javaOperator', { fg = base0D, ctermfg = cterm0D })

-- vim: filetype=lua
