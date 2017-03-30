"Python3 support"
"if use pyenv
"let g:python3_host_prog = expand('$HOME') . '/.pyenv/shims/python3'
"let g:python2_host_prog = expand('$HOME') . '/.pyenv/shims/python2'

"if use system python
let g:python3_host_prog =  '/usr/local/bin/python3'
let g:python2_host_prog =  '/usr/local/bin/python2'

if &compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" dein settings {{{
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir . "," . &runtimepath


let s:toml_file = fnamemodify(expand('<sfile>'), ':h') . '/dein.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir, [$MYVIMRC, s:toml_file])
  call dein#load_toml(s:toml_file)

  call dein#end()
  call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" }}}

if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

colorscheme jellybeans
let g:jellybeans_use_lowcolor_black=0

"Nerdtree
map <silent> - :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=22
let g:NERDTreeAutoDeleteBuffer=1

  " let g:webdevicons_enable_nerdtree = 0
  let g:WebDevIconsUnicodeDecorateFolderNodes = 1
  let g:DevIconsEnableFoldersOpenClose = 1
  " let g:NERDTreeFileExtensionHighlightFullName = 1

"airline settings
let g:airline_powerline_fonts = 1

"vim-devicons
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

" dir-icons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
let g:DevIconsDefaultFolderOpenSymbol = ''
" file-icons
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['html'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['css'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['md'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['txt'] = ''
" Use deoplete.
let g:deoplete#enable_at_startup=1

"Recognition of markdown files
au BufRead,BufNewFile *.md set filetype=markdown

"devicons
set guifont=Sauce\ Code\ Pro\ Nerd\ Font\ Complete:h13



"key bind for parantheses
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

set encoding=UTF-8
set fileencoding=UTF-8
set termencoding=UTF-8
set backupdir=~/Documents/Vim_backup
set directory=~/Documents/Vim_backup
set expandtab
set smarttab
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2

set cursorline
set number
set showmatch
set incsearch
set completeopt=menuone
set splitright
set splitbelow
set backspace=indent,eol,start
set ignorecase
set smartcase
set clipboard+=unnamedplus

"for shell
set sh=/bin/zsh
tnoremap <silent> <ESC> <C-\><C-n>
let g:neoterm_shell='/bin/zsh'

