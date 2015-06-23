"" 文本排版
set expandtab
set shiftwidth  =4
set tabstop     =4
set smarttab
set linebreak
set textwidth   =500
set autoindent          "" 自动缩进
set smartindent         "" 智能缩进
set wrap                "" 换行
if has("gui_gtk2")
  set guifont=Bitstream\ Vera\ Sans\ Mono\ 9,Fixed\ 9
  set guifontwide=Microsoft\ Yahei\ 9,WenQuanYi\ Zen\ Hei\ 9
endif

"" pathogen(plugin)(must before :filetype on)
call pathogen#infect()

"" 语法高亮文件类型
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

" YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'

" CoffeeScript
let coffee_make_options = '-b -c -m'

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

nmap <F2> :TagbarToggle<CR>
"" NERD tree map keys(insert mode and normal mode)
" Disable AutoComplPop. 
let g:acp_enableAtStartup = 0 
" Use neocomplcache. 
let g:neocomplcache_enable_at_startup = 1 
" Use smartcase. 
let g:neocomplcache_enable_smart_case = 1 
" Use camel case completion. 
let g:neocomplcache_enable_camel_case_completion = 1 
" Use underbar completion. 
let g:neocomplcache_enable_underbar_completion = 1
map! <F3> <ESC>:NERDTreeToggle<CR>i
map  <F3>      :NERDTreeToggle<CR>

"" Auto session
let g:session_autoload = 'yes'
let g:session_autosave = 'yes'

"" general maps with buffer and tab
map! <S-Left>  <ESC>:bp<CR>i
map  <S-Left>       :bp<CR>
map! <S-Right> <ESC>:bn<CR>i
map  <S-Right>      :bn<CR>

"ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

"" change color schema end with file
colorscheme desert 

