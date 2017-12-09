set runtimepath^=${SOURCEDIR}/.vim
set nocompatible
set modeline
set smartindent

"""""""""" HELP
let help_file = expand('$SOURCEDIR/.vimhelp')
let help_mode = 'on'
function HelpToggle()
  if g:help_mode == 'on'
    let g:help_mode = 'off'
    execute ":10split " . g:help_file
  else
    let g:help_mode = 'on'
    execute ":bdelete " . g:help_file
  endif
endfunction
nnoremap <F2> :execute HelpToggle()<CR>

"""""""""" ruler
set ruler
set rulerformat=%50(%=%m%r%w\ \|\ <F2>=help\ \|\ [%3l\/%L,%3c]%)
set showcmd
set showmode


"""""""""""""""""
try
  set t_Co=256
catch
endtry

try
  colorscheme codeschool
catch
  colorscheme industry
endtry

""""""""" toggle paste/nopaste
nnoremap <F3> :set invpaste paste?<CR>
set pastetoggle=<F3>

"""""""""
syntax on
set scrolloff=7

""""""""""" tab sucks
let tab_mode = 'new'
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
" allow toggling between local and default mode
function TabToggle()
  if g:tab_mode == 'new'
    let g:tab_mode = 'old'
    set shiftwidth=8
    set softtabstop=8
    set tabstop=8
    set noexpandtab
    echom 'TABS'
  else
    let g:tab_mode = 'new'
    set tabstop=2
    set shiftwidth=2
    set softtabstop=2
    set expandtab
    echom 'SPACES'
  endif
endfunction
nmap <F4> mz:execute TabToggle()<CR>'z
"
"""""""" Replace all tabs

function ReTab()
  if !&expandtab
    set expandtab
    retab
    set noexpandtab
  else
    retab
  endif
  echo 'TABS replaced by SPACES'
endfunction
nnoremap <F8> mz:execute ReTab()<CR>'z

""""""""  show unwanted trailing white characters
highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+$/
highlight Tabs ctermbg=Black ctermfg=DarkGrey
match Tabs /\t/
set list
set listchars=tab:>.,trail:.
"""""""

"""""""" Remove all trailing whitespace
nnoremap <F7> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

"""""""" Mouse mode
set mouse=a

"""""""" Clean the highlight
nnoremap <F5> :let @/ = "" <CR>

" Tab makes completion
" inoremap <tab> <C-N>

" turn off buildin markdown support
autocmd FileType markdown setlocal syntax=off

" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Turn on the WiLd menu
set wildmenu
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" A buffer becomes hidden when it is abandoned
set hid

"""""" Searching
set hlsearch
set ignorecase
set smartcase
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set encoding=utf8
set ffs=unix,dos,mac

" no backup
set nobackup
set nowb
set noswapfile

""""""  Return to last edit position when opening files
au BufReadPost *
      \ if
      \ line("'\"") > 1 && line("'\"") <= line("$")
      \ | exe "normal! g'\"" |
      \ endif

"""""" highlight 80th collumn as warning
highlight CollumnLimit ctermbg=DarkGrey
augroup collumnLimit
  autocmd!
  let collumnLimit = 80
  let pattern = '\%<' . (collumnLimit+1) . 'v.\%>' . collumnLimit . 'v'
  let w:m1=matchadd('CollumnLimit', pattern, -1)
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""" PLUG-IN """""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/vim-plug')
Plug 'ervandew/supertab'
"Plug 'vim-syntastic/syntastic'
"if ! empty(glob('~/.env/.vim/vim-plug/syntastic/plugin/syntastic.vim'))
"  set laststatus=2
"  set statusline+=%#warningmsg#
"  set statusline+=%{SyntasticStatuslineFlag()}
"  set statusline+=%*
"  let g:syntastic_always_populate_loc_list = 1
"  let g:syntastic_auto_loc_list = 1
"  let g:syntastic_check_on_open = 1
"  let g:syntastic_check_on_wq = 1
"  endif
Plug 'iamcco/markdown-preview.vim'
if ! empty(glob('~/.vim/vim-plug/markdown-preview.vim/plugin/mkdp.vim'))
  nmap <silent> <F11> <Plug>MarkdownPreview        " for normal mode
  imap <silent> <F11> <Plug>MarkdownPreview        " for insert mode
  nmap <silent> <F12> <Plug>StopMarkdownPreview    " for normal mode
  imap <silent> <F12> <Plug>StopMarkdownPreview    " for insert mode
endif
Plug 'scrooloose/nerdtree'
if ! empty(glob('~/.vim/vim-plug/nerdtree/autoload/nerdtree.vim'))
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  let NERDTreeShowHidden=1
  nmap <silent> <F9> :NERDTreeToggle<CR>
  imap <silent> <F9> <Esc>:NERDTreeToggle<CR>
endif
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""" THE END """""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""" cursorline
"try
"  hi CursorLine cterm=NONE ctermbg=235
"catch
"  hi CursorLine cterm=bold
"endtry
"  set cursorline
