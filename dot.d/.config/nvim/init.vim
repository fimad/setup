call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter'
Plug 'brooth/far.vim', { 'on': 'Far' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'iCyMind/NeoSolarized'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all', 'on': 'FZF' }
Plug 'vim-airline/vim-airline'

" Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install' }
" Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
" Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }

Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

Plug 'jistr/vim-nerdtree-tabs', { 'on': 'NERDTreeTabsToggle' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeTabsToggle' }

Plug 'jistr/vim-nerdtree-tabs', { 'on': 'NERDTreeTabsToggle' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeTabsToggle' }

" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'


call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins

let g:airline_powerline_fonts = 1

""""""""""""""""""""""""""""""""""""""""
" Tern

let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif

set completeopt=longest,menuone 
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] =  ['file', 'neosnippet', 'ternjs']
let g:deoplete#sources['javascript'] = ['file', 'neosnippet', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']
let g:tern_show_argument_hints = 'on_hold'
let g:tern_show_signature_in_pum = 1
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]

let g:deoplete#auto_complete_delay=50

" use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.local/share/nvim/plugged/neosnippet-snippets/'
let g:neosnippet#enable_completed_snippet=1

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

nnoremap <leader>f :NERDTreeTabsToggle<cr>
let g:NERDTreeWinSize = 35
let NERDTreeShowHidden=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Bindings

" Press jj fast to get back to normal mode from typing.
inoremap jj <ESC>

" Set up an easy to reach leader
let mapleader = ";"

" Sort a block of text.
nnoremap <leader>rt vip:sort<cr>
vnoremap <leader>rt :sort<cr>

" Invert paste mode.
nnoremap <leader>st :set invpaste paste?<CR>

" Make FZF behave like ctrlp.
map <C-p> :FZF<cr>

" Pull up the vimrc and refresh.
nnoremap <leader>ve :tabnew $MYVIMRC<cr>
nnoremap <leader>vr :source $MYVIMRC<cr>

" NERDTree
nnoremap <leader>f :NERDTreeTabsToggle<cr>
let g:NERDTreeWinSize = 35

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Appearance 

" Solarized
set t_Co=256
set background=dark
colorscheme NeoSolarized

set nofoldenable " Folds suck

set cursorcolumn
set cursorline
set nu "line numbers

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Behavior

" Fuck swap files
set noswapfile
set nobackup
set nowb

set cindent
set copyindent
set smartindent
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set textwidth=80

set showcmd   " Show (partial) command in status line.
set showmatch   " Show matching brackets.
set ignorecase    " Do case insensitive matching
set smartcase   " Do smart case matching

set spell spelllang=en_us

if !empty(glob("$HOME/.config/nvim/local.vim"))
  source $HOME/.config/nvim/local.vim
end
