set ignorecase
set autoindent
set history=50
set ruler
set showcmd
syntax on
set hlsearch
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

set nocompatible              " be iMproved, required
filetype on
colorscheme alastair
set tabstop=4
set shiftwidth=4
set expandtab
set number
filetype indent on
set autoindent
set hlsearch
set termguicolors

" Move lines with alt j/k
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-k> <Esc>:m .-2<CR>="=gi
inoremap <A-j> <Esc>:m .+1<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

vnoremap <C-c> "+y


"COC
set hidden
set nobackup
set nowritebackup

set cmdheight=2
set updatetime=300
set shortmess+=c

inoremap <silent><expr> <c-space> coc#refresh()
"Leaders"
let mapleader = " "
"NERD Tree toggle
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <C-space>b :map<CR>
nnoremap <leader>z :FZF<CR>
" Dead
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>a :Ag<CR>
nnoremap <leader>l :BLines<CR> " search lines in current buffer
nnoremap <leader>b :Buffer<CR>
nnoremap <leader>h :History<CR>
nnoremap <leader>hh :History<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-h><C-h> :tabnext<CR>
nnoremap <C-l><C-l> :tabprevious<CR>

nnoremap <C-h><C-h> :bprevious<CR>
nnoremap <C-l><C-l> :bnext<CR>
nnoremap <Tab>h :tabprevious<CR>
nnoremap <Tab>l :tabnext<CR>

" number autoswitching
:set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

:set mouse=a

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
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
