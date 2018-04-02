set nocompatible
set relativenumber
set ruler
set cursorline
set clipboard=unnamedplus
filetype off 
syntax enable
set background=light
set t_Co=16
set laststatus=2
set foldmethod=syntax
set foldlevel=20
set noswapfile

" Indentation settings
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

" Match opening and closings on hitting %
runtime macros/matchit.vim

nnoremap j gj
nnoremap k gk

" Easy tab navigation, for rest, use macros
nnoremap tn :tabprev <CR>
nnoremap tm :tabnext <CR>

" Ambiguous tags
nnoremap <C-]> g<C-]>

" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_regexp = 1
" This may not work for older vim installations
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Goto the start of text instead of line
nmap 0 ^

let mapleader = "\<Space>"

" Map space q to quit and space s to save file
noremap <leader>s :w<cr>
noremap <leader>q :q!<cr>

" Toggle NERDTree
nmap <leader>nt :NERDTreeToggle<cr>
nmap <Leader>nf :NERDTreeFind<cr>
nmap <leader>cn :cn<cr>

" CtrlSF mappings                                                                     
nmap <leader>io <Plug>CtrlSFPrompt
vmap <C-F>f <Plug>CtrlSFVwordPath 

nmap <leader>y :only<cr>

" Clear Search
nmap <leader>cl :noh<cr>

" vim-fugitive specific binds
nmap <Leader>df :Gdiff<cr>
nmap <Leader>rt :Gwrite<cr>
nmap <Leader>st :Gstatus<cr>

" Rails.vim specific key bindings
nmap <leader>ev :Sview<cr>
nmap <leader>em :Smodel<cr>
nmap <leader>ec :Scontroller<cr>

" Leader mapings for VTR
nmap <leader>vt :VtrAttachToPane
nmap <leader>vf :VtrSendFile<cr>
nmap <leader>vc :VtrSendCommandToRunner<cr>
vmap <leader>r :VtrSendLinesToRunner<cr>
nnoremap <leader>irb :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'irb'}<cr>

" Navigate in between wrapped lines
"nmap k gk
"nmap j gj 

" Typing vr opens vimrc
nmap <leader>vr :vsp $MYVIMRC<cr>
nmap <leader>vs :source ~/.vimrc<cr>

" Ctrl-a escapes insert mode
inoremap <C-a> <esc>


" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

""""""""""""""""""""""""""""""""""""""""""""
" All Plugins go here
""""""""""""""""""""""""""""""""""""""""""""
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-rails'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Plugin 'raimondi/delimitmate'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'dyng/ctrlsf.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'christoomey/vim-tmux-runner'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'digitaltoad/vim-pug'
Plugin 'machakann/vim-highlightedyank'
Plugin 'easymotion/vim-easymotion'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

colorscheme solarized

function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

"autocmd BufEnter * call SyncTree()
