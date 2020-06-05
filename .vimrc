"if empty(glob('~/.vim/autoload/plug.vim'))
"  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif
let g:ale_completion_enabled = 1
""" VIM PLUG config
call plug#begin()
"Plug 'https://github.com/vim-airline/vim-airline'
Plug 'mbbill/undotree'
Plug 'w0rp/ale'
"Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
"Plug 'sheerun/vim-polyglot'
"Plug 'majutsushi/tagbar'
"Plug 'vim-syntastic/syntastic'
"Plug 'hdima/python-syntax'
"Plug 'vim-python/python-syntax'
Plug 'tpope/vim-commentary'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'vimwiki/vimwiki' 
Plug 'elmcast/elm-vim'
call plug#end()
""" VIM PLUG config   
let g:airline_powerline_fonts = 1
let g:elm_format_autosave = 1
""" Settings at bottom
" Change cursor shape between insert and normal mode in iTerm2.app
let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode

let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

set nocompatible              " be iMproved, required
filetype on
colorscheme alastair
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set number
filetype indent on
set autoindent
set hlsearch
set termguicolors
:nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
" Move lines with alt j/k
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-k> <Esc>:m .-2<CR>="=gi
inoremap <A-j> <Esc>:m .+1<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

vnoremap <C-c> "+y

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Display extra whitespace
set list
set listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

set backspace=2
" Enable Folding
set foldmethod=indent
set foldlevel=99
" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
"Leaders"
let mapleader = " "
"NERD Tree toggle
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <C-space>b :map<CR>
nnoremap <leader>b :Buffer<CR>
nnoremap <leader>h :History<CR>
nnoremap <leader>hh :History<CR>
nnoremap <leader>z :FZF<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>a :Ag<CR>
nnoremap <leader>l :BLines<CR> " search lines in current buffer
nnoremap <leader>pn :ALENext<CR>
" number autoswitching
:set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

:set mouse=a

" COC recommendations
set hidden
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
"'inoremap <silent><expr> <TAB>
      "\ pumvisible() ? "\<C-n>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript
