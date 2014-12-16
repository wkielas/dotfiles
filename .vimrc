set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'AutoComplPop'
Plugin 'EnhCommentify.vim'
Plugin 'Gundo'
Plugin 'Lokaltog/vim-powerline'
Plugin 'OmniCppComplete'
Plugin 'Syntastic'
Plugin 'TabBar'
Plugin 'YankRing.vim'
Plugin 'a.vim'
Plugin 'elzr/vim-json'
Plugin 'errormarker.vim'
Plugin 'jwhitley/vim-matchit'
Plugin 'pydoc.vim'
Plugin 'python_match.vim'
Plugin 'rainbow_parentheses.vim'
Plugin 'repeat.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'snipMate'
Plugin 'surround.vim'
Plugin 'taglist.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle 'Wombat'
Bundle 'vim-ruby/vim-ruby'

"manpageviewPlugin.vim
"utl.vim

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Put your non-Plugin stuff after this line
let g:EnhCommentifyRespectIndent = 'Yes'

filetype plugin on
syntax on

set showmode
set wildmenu
set wildmode=list:longest,full
set autoread
set smartindent
set showcmd
set shiftwidth=2
set shiftround
set so=5
set bs=2
set nocp
set autoindent
set shiftwidth=2
set tabstop=2
set nu
set hid
set ignorecase
set smartcase
set hlsearch
set nocompatible
set laststatus=2

set incsearch
set foldmethod=manual
set background=dark
set nobackup
set nowb
set noswapfile
set completeopt=menuone,menu,longest,preview
set nospell
set list listchars=tab:->,eol:¶
set nolist
set spelllang=pl

au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

set expandtab
set undodir=~/.vim/undo
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

set guiheadroom=0
let g:notes_directories = ['~/HG_REPOS/Vimnotes/']
let g:notes_suffix = '.txt'

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
map <F1> :YRShow<CR>
map <F2> :NERDTreeToggle<CR>
map <F3> :set spell!<CR>
map <F4> :noh<CR>
map <F5> :set list!<CR>
map <F6> :TlistToggle<CR>
map <F7> :GundoToggle<CR>
map <F8> :A<CR>
map <F9> :%!astyle -A8 -M1 -k1 -SUTYDfx<CR>
map <F10> :call TwinTurboLines()<CR>

" map j to gj and k to gk, so line navigation ignores line wrap
nmap j gj
nmap k gk

map <F12> :w<CR>
imap jj <Esc>

nmap <C-h> <<
nmap <C-l> >>
vmap <C-h> <
vmap <C-l> >

vmap <C-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <C-k> :m'<-2<cr>`>my`<mzgv`yo`z
nnoremap <C-j> mz:m+<cr>`z
nnoremap <C-k> mz:m-2<cr>`z

nmap <leader>r :call TwinTurboRainbow()<CR>

let OmniCpp_ShowPrototypeInAbbr = 1 "show prototype in pop-up
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_SelectFirstItem = 2
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "boost", "_GLIBCXX_STD"]

let g:CommandTMaxFiles=50000
let g:CommandTScanDotDirectories=1

let g:pydoc_wh = 20

let g:yankring_window_use_bottom = 1

let g:vim_json_syntax_conceal = 0

au BufRead,BufNewFile *.template              set filetype=json

function! SuperCleverTab()
    if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
        return "\<Tab>"
    else
        if &dictionary != ''
            return "\<C-K>"
        else
            return "\<C-Y>"
        endif
    endif
endfunction
inoremap <Tab> <C-R>=SuperCleverTab()<cr>

let g:TTLines = 1
function! TwinTurboLines()
        if g:TTLines == 1
                set nonu
                set relativenumber
                let g:TTLines = 2
        else
                set norelativenumber
                set nu
                let g:TTLines = 1
        endif
endfunction

let g:TTrainbow = 1
function! TwinTurboRainbow()
        if g:TTrainbow == 1
                call rainbow_parentheses#Toggle()
                let g:TTrainbow= 2
        else
                colorscheme wombat
                let g:TTrainbow= 1
        endif
endfunction

autocmd Filetype tex source ~/.vim/polski-latex.vim

ino <silent> <F11> <c-r>=TriggerSnippet()<cr>
snor <silent> <F11> <esc>i<right><c-r>=TriggerSnippet()<cr>
ino <silent> <s-F11> <c-r>=BackwardsSnippet()<cr>
snor <silent> <s-F11> <esc>i<right><c-r>=BackwardsSnippet()<cr>
ino <silent> <c-F11> <c-r>=ShowAvailableSnips()<cr>
