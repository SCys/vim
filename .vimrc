call plug#begin('~/.vim/bundle')
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'fatih/vim-go', { 'tag': '*', 'do': ':GoInstallBinaries', 'for': 'go' }
Plug 'nsf/gocode', { 'rtp': 'vim', 'for': 'go' }
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
call plug#end() " Should run at last

"" 文本排版
set expandtab
set shiftwidth  =4
set tabstop     =4
set smarttab
set linebreak
set textwidth   =128
set autoindent
set smartindent
set wrap

syntax   on
filetype plugin on
filetype indent on

"" 状态条
highlight statusline_type term=bold,reverse cterm=bold,reverse ctermfg=DarkBlue gui=bold,reverse guifg=DarkBlue
set laststatus  =2
set statusline  =\ %f                           "" file name
set statusline +=%m%r%h                         "" file operation
set statusline +=%#statusline_type#%y%*%*       "" file type
set statusline +=\ %w                           ""
set statusline +=CWD:\ %r%{_current_CurDir()}%h "" working direction
set statusline +=%=Line:\ %l/%L:%c              "" row/total row/col number
function! _current_CurDir()
    let curdir = substitute(getcwd(), '/home/scys/', "~/", "g")
    return curdir
endfunction

set backspace=indent,eol,start
set hidden

"" fast change the buffer window 
map! <S-Left>  <ESC>:bp<CR>i
map  <S-Left>       :bp<CR>
map! <S-Right> <ESC>:bn<CR>i
map  <S-Right>      :bn<CR>

"" the color theme 
colorscheme desert 

nmap <leader>s<left>   :leftabove  vnew<cr>
nmap <leader>s<right>  :rightbelow vnew<cr>
nmap <leader>s<up>     :leftabove  new<cr>
nmap <leader>s<down>   :rightbelow new<cr>

nmap <leader>n :NERDTreeToggle<CR>

noremap <tab> <c-w>w
noremap <S-tab> <c-w>W

nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

