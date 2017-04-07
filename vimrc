set nocompatible
set relativenumber
set cursorline
filetype off 
syntax enable
set background=dark
set t_Co=16

" Indentation settings
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

" Match opening and closings on hitting %
runtime macros/matchit.vim


" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_regexp = 1

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

" Search
nmap <leader>y :only<cr>

" vim-fugitive specific binds
nmap <Leader>df :Gdiff<cr>
nmap <Leader>rt :Gwrite<cr>
nmap <Leader>st :Gstatus<cr>

" Rails.vim specific key bindings
nmap <leader>ev :Sview<cr>
nmap <leader>em :Smodel<cr>
nmap <leader>ec :Scontroller<cr>

" Navigate in between wrapped lines
nmap k gk
nmap j gj 

" Typing vr opens vimrc
nmap <leader>vr :vsp $MYVIMRC<cr>
nmap <leader>vs :source ~/.vimrc<cr>
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
Plugin 'raimondi/delimitmate'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'dyng/ctrlsf.vim'

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
