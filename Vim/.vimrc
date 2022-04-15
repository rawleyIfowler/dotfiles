"Not compatible with vi, which causes problems
set nocompatible
"Get filetype
filetype on
filetype plugin on
filetype indent on
filetype plugin indent on
"Plugins in ~/.vim/plugged
call plug#begin()
    Plug 'jiangmiao/auto-pairs'
    Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
    Plug 'arzg/vim-swift', { 'for': 'swift' }
    Plug 'tyru/open-browser.vim'
    Plug 'junegunn/vim-easy-align'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'preservim/NERDTree', { 'on': 'NERDTreeToggle' }
    Plug 'itchyny/lightline.vim'
    Plug 'tpope/vim-surround'
    Plug 'https://github.com/KabbAmine/yowish.vim'
    Plug 'https://github.com/ap/vim-css-color'
    Plug 'neoclide/coc.nvim'
    Plug 'digitaltoad/vim-pug', { 'for': 'pug' }
    Plug 'ap/vim-buftabline'
    Plug 'dracula/vim'
    Plug 'fatih/vim-go', { 'for': 'go' }
    Plug 'frazrepo/vim-rainbow'
    Plug 'clojure-vim/clojure.vim', { 'for': 'clojure' }
    Plug 'vim-scripts/VimClojure', { 'for': 'clojure' }
call plug#end()
"Dracula > All
colorscheme dracula
syntax on
set ai
set number
set ts=4
set sw=4
set background=dark
set nowrap
set hidden
set showcmd
set wildmenu
set hlsearch
set confirm
set expandtab
"Buffer hopping
nmap <C-h> :bp<cr>
nmap <C-l> :bn<cr>
nmap <C-q> :Bclose<cr>
"Ripgrep with fzf
nmap <C-f> :Rg<cr>
"Nerd tree
nmap <S-w> :NERDTreeToggle<cr>
"COC auto complete
inoremap <expr> <Tab>	pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<Tab>" : "\<cr>"
"For writing blog posts
autocmd BufNewFile,BufRead *.html,*.txt,*.blog set spell
autocmd BufNewFile,BufRead *.html,*.txt,*.blog set wrap
"Load only on Lisp, Clojure, or Emacs Lisp files for rainbow parens
au FileType clojure,lisp,lsp,cl,l,el,elc,eln call rainbow#load()
"Toggle on rainbow parens by default if the following file type is detected
let fts=['clojure', 'lisp', 'lsp', 'cl', 'el', 'eln', 'l', 'elc']
if index(fts, &filetype) != -1
    "Clojure style standards like 2 space indents check it out:
    "https://guide.clojure.style
    set ts=2
    set sw=2
    :RainbowToggle
endif
"Configure clojue fuzzy indents and alignments
let g:clojure_fuzzy_indent = 1
let g:clojure_align_subforms = 1
"Fix weird background color issues with dracula color scheme
if &term =~ '256color'
    set t_ut=
endif
