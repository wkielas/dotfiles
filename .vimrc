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
"set autochdir
set noswapfile
set completeopt=menuone,menu,longest,preview
set nospell
set list listchars=tab:->,eol:¶
set nolist
set spelllang=pl
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

"highlight Pmenu guibg=gray guifg=black

call pathogen#runtime_append_all_bundles()
au Bufenter *.hs, *.rb, *.pp, *.yaml set expandtab
au Bufenter *.hs compiler ghc
let g:haddock_browser = "open"

set expandtab
set undodir=~/.vim/undo
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload


set guiheadroom=0
let g:notes_directory = '~/HG_REPOS/Vimnotes/'
let g:notes_suffix = '.txt'
call pathogen#runtime_append_all_bundles()

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
nmap <leader>p :.!python<CR> 
vmap <leader>p :!python<CR> 

"let g:miniBufExplMapWindowNavVim = 0
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1 

set tags+=/home/herself/.vim/cpptag
set tags+=/home/herself/.vim/stl
set tags+=/home/herself/.vim/boost
set tags+=tags
set tags+=./tags
set tags+=./../tags

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

let Tlist_Enable_Fold_Column = 0
let Tlist_WinWidth = 30
let Tlist_Compact_Format = 1
set updatetime=1

let g:CommandTMaxFiles=50000
let g:CommandTScanDotDirectories=1

let g:pydoc_wh = 20

let g:yankring_window_use_bottom = 1

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


function! GetTheRightOne()
python << EOF
import vim, traceback

interpreter = str()
docs = str()

try:
	if "python3" in vim.current.buffer[0]:
		interpreter = "python3"
		docs = "pydoc3"
	else:
		interpreter = "python"
		docs = "pydoc"

except Exception:
	traceback.print_exc(file=sys.stdout)

vim.command("let g:pydoc_cmd = '%s'" % docs)
#vim.command("set makeprg=%s\\ -c\\ \\\"import\\ py_compile,sys;\\ sys.stderr=sys.stdout;\\ py_compile.compile(r'%%')\\\"" % interpreter)
EOF
endfunction

autocmd BufRead *.py call GetTheRightOne()
"chuj ci kurwa w piete pythonie, zaden errorformat nie dziala i jeszcze kurwa do tego chujec rozne typy bledow wyswietla dla python2 i python3...
"set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m 
"set errorformat=
"  \%A\ \ File\ \"%f\"\\\,\ line\ %l\\\,%m,
"  \%C\ \ \ \ %.%#,
"  \%+Z%.%#Error\:\ %.%#,
"  \%A\ \ File\ \"%f\"\\\,\ line\ %l,
"  \%+C\ \ %.%#,
"  \%-C%p^,
"  \%Z%m,
"  \%-G%.%#

"autocmd BufRead *.py set makeprg=python3\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
"autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
"set makeprg=python\ -uc\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"\\\|grep\ -v\ \"^$\"
"set errorformat=%\\w%#%trror:\ ('%m'\\,\ ('%f'\\,\ %l\\,\ %c\\,\ '%.%#'))
 

fun! CompleteEmails(findstart, base)
    if a:findstart
        let line = getline('.')
        "locate the start of the word
        let start = col('.') - 1
        while start > 0 && line[start - 1] =~ '[^:,]'
            let start -= 1
        endwhile
        return start
    else
        " find the addresses ustig the external tool
        " the tools must give properly formated email addresses
        let res = []
        for m in split(system('mutt-evo-query -r  ' . shellescape(a:base)), '\n')
                call add(res, m)
        endfor
        return res
    endif
endfun

fun! UserComplete(findstart, base)
    " Fetch current line
    let line = getline(line('.'))
    " Is it a special line?
    if line =~ '^\(To\|Cc\|Bcc\|From\|Reply-To\):'
        return CompleteEmails(a:findstart, a:base)
    endif
endfun

au BufReadPost /tmp/mutt*  set completefunc=UserComplete
autocmd Filetype tex source ~/.vim/polski-latex.vim

au BufRead,BufNewFile *.template              set filetype=json
let g:vim_json_syntax_conceal = 0
