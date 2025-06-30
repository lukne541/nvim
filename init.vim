set nocompatible

set noincsearch
set ignorecase
set smartcase

call plug#begin('/home/lnee/.config/nvim/autoload')
"Plug 'dense-analysis/ale'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'voldikss/vim-floaterm'
Plug 'tpope/vim-commentary'
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-fugitive'
Plug 'zivyangll/git-blame.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rhysd/vim-clang-format'
"Plug 'sbdchd/neoformat'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Mofiqul/vscode.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'sainnhe/gruvbox-material'
Plug 'airblade/vim-rooter'
Plug 'feline-nvim/feline.nvim'
"Plug 'nvim-tree/nvim-web-devicons'
Plug 'lewis6991/gitsigns.nvim'
Plug 'RRethy/vim-illuminate'
call plug#end()

set termguicolors
set mouse=
set completeopt-=preview
set nohidden
"let g:ycm_global_ycm_extra_conf = '/home/lnee/.config/nvim/ycm_extra_conf.py'
let g:ycm_max_diagnostics_to_display = 10
let g:ycm_clangd_args=['--header-insertion=never', '--clang-tidy']
let g:blameLineVirtualTextHighlight = 'Conceal'
"let g:clang_format#command = 'clang-format-15'
let g:python3_host_prog = '/usr/bin/python3'
let g:blamer_enabled = 0
let g:blamer_delay = 510
let g:ale_cpp_cpplint_executable = '/opt/cpplint/cpplint/cpplint.py'

"colorscheme gruvbox-material 
"colorscheme retrobox 
"colorscheme evening
colorscheme desert


set tabpagemax=100
set wildmenu
set relativenumber
set expandtab
set shiftwidth=2
set softtabstop=2
filetype plugin indent on

nmap <F3> :exec &nu==&rnu? "se nu!" : "se rnu!"
nnoremap <C-Space> :YcmCompleter GoToDeclaration

" find files and populate the quickfix list
fun! FindFiles(path)
  tabnew
  let relpath=fnamemodify(a:path, ':p:h:t') . '/' . fnamemodify(a:path, ':t:r')
  let error_file = tempname()
  silent exe '!find . -path "*'.relpath.'*" | xargs file | sed "s/:/:1:/" > '.error_file
  set errorformat=%f:%l:%m
  exe "cfile ". error_file
  copen
  call delete(error_file)
endfun

" [R]elated [f]ile [s]earch
command Rfs call FindFiles(@%)
set encoding=utf-8
map <C-Q> :Rfs

lua require('feline').setup()
lua require('gitsigns').setup()


" Rooter setup
let g:rooter_targets = '*.cpp,*.h,*.taco,*.cmake,*.rst'
let g:rooter_patterns = ['>BSW']

" Illuminate setup
let g:Illuminate_ftblacklist = ['o']

let g:ycm_filetype_blacklist = {
      \ 'ycm_nofiletype': 1
      \}

" FloatTerm mappings.
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_toggle = '<F8>'
let g:floaterm_height = 1.0
let g:floaterm_width = 1.0

" clang-format
let g:clang_format#detect_style_file = 1

" Telescope find_files
nnoremap <silent>    <A-f> <cmd>Telescope find_files<cr>

" Goto tab in position...
nnoremap <silent>    <A-1> 1gt
nnoremap <silent>    <A-2> 2gt
nnoremap <silent>    <A-3> 3gt
nnoremap <silent>    <A-4> 4gt
nnoremap <silent>    <A-5> 5gt
nnoremap <silent>    <A-6> 6gt
nnoremap <silent>    <A-7> 7gt
nnoremap <silent>    <A-8> 8gt
nnoremap <silent>    <A-9> 9gt

nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

fun! SetClangFormatCommand(path)
  let b:grep_res = ""
  redir => b:grep_res
  silent exe '!grep -r "clang_format: " '.a:path."/config"
  redir END
  if b:grep_res =~ ".*15.*"
    let g:clang_format#command = 'clang-format-15'
  else
    let g:clang_format#command = 'clang-format-6.0'
  endif
endfun

fun! SetTabWidth()
set shiftwidth=3
set softtabstop=3
endfun

augroup AG1
  autocmd FileType c,cpp,cmake ClangFormatAutoEnable
  autocmd BufEnter rst call SetTabWidth()
  "autocmd FileType cpp TSEnable highlight
  "autocmd BufEnter * call SetClangFormatCommand(getcwd())

  autocmd BufRead *.o set filetype=ycm_nofiletype
augroup END

"set verbose=9
