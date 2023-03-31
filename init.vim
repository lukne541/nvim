call plug#begin('/home/lnee/.local/share/nvim/site/autoload')
"Plug 'dense-analysis/ale'
Plug 'tpope/vim-commentary'
Plug 'Valloric/YouCompleteMe', {'commit': '70c2a500a4349cde8521b556a7fa29b2e0046afc'}
Plug 'tpope/vim-fugitive'
Plug 'zivyangll/git-blame.vim'
Plug 'rhysd/vim-clang-format'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Mofiqul/vscode.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'sainnhe/gruvbox-material'
Plug 'airblade/vim-rooter'
Plug 'nvim-tree/nvim-web-devicons'
call plug#end()


set mouse=
set completeopt-=preview
set nohidden
let g:ycm_global_ycm_extra_conf = '/home/lnee/.config/nvim/.ycm_extra_conf.py'
let g:blameLineVirtualTextHighlight = 'Conceal'
let g:python3_host_prog = '/usr/bin/python3'
let g:clang_format#command = 'clang-format-15'
let g:blamer_enabled = 0
let g:blamer_delay = 510
let g:ale_cpp_cpplint_executable = '/opt/cpplint/cpplint/cpplint.py'
autocmd FileType c,cpp,cmake ClangFormatAutoEnable

autocmd FileType cpp TSEnable highlight

"colorscheme gruvbox-material 
colorscheme evening



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


" Rooter setup
let g:rooter_targets = '*.cpp,*.h,*.taco,*.cmake'
let g:rooter_patterns = ['>BSW']


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


