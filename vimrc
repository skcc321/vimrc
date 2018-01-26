"------------------- Vim settings -----------------------
" autosave view
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

endif

au BufWritePre * :%s/\s\+$//e       " trailing whitespaces

set shell=/bin/bash
set clipboard=unnamed,unnamedplus   " use system clipboard
set tags+=gems.tags                 " ctags
set nu                              " enable left numbers
set rnu
set fillchars=vert:\                " disable vert div chars
set nocompatible                    " be iMproved, required
set cursorline                      " highlight the cursor screen line "
set cursorcolumn                      " highlight the cursor screen line "
set scrolloff=5                     " minimal number of screen lines to keep above and below the cursor "
set spell spelllang=en_us           " spellchecker
set lazyredraw                      " lazyredraw

" Auto indentation
set expandtab
set shiftwidth=2
set softtabstop=2

let g:ruby_indent_access_modifier_style="indent"

" String to put at the start of lines that have been wrapped "
let &showbreak='↪ '

" remap colon
map ; :

" jump to end of text you pasted
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" remap esc
imap jj <Esc>

" leader
let mapleader=","

"---------------- Plugins -------------------
call plug#begin('~/.vim/plugged')
  Plug 'vim-scripts/L9'
  Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
  Plug 'gmarik/Vundle.vim'

  " Navigation
  Plug 'bkad/CamelCaseMotion'
  Plug 'Lokaltog/vim-easymotion'
  Plug 'scrooloose/nerdtree'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'rking/ag.vim'
  Plug 'majutsushi/tagbar'
  Plug 'matze/vim-move'

  " Correction
  Plug 'w0rp/ale'
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
  Plug 'junegunn/vim-easy-align'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'Raimondi/delimitMate'
  Plug 'reedes/vim-wordy'

  " Appearance
  Plug 'tomasr/molokai'
  Plug 'airblade/vim-gitgutter'
  Plug 'kshenoy/vim-signature'
  Plug 'Bling/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'gorodinskiy/vim-coloresque'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'skywind3000/asyncrun.vim'

  " Objects
  Plug 'kana/vim-textobj-user'
  Plug 'glts/vim-textobj-comment'

  " General editing
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tomtom/tcomment_vim'

  " Ruby/Rails
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-rails'
  Plug 'vim-ruby/vim-ruby'
  Plug 'AndrewRadev/switch.vim'
  Plug 'thoughtbot/vim-rspec'
  Plug 'danchoi/ruby_bashrockets.vim'

  " Languages
  Plug 'slim-template/vim-slim'
  Plug 'kchmck/vim-coffee-script'
  Plug 'chr4/nginx.vim'
  Plug 'zaiste/tmux.vim'
  Plug 'elzr/vim-json'
  Plug 'TAKAyukiatkwsk/vim-mongoid-syntax'
  Plug 'pangloss/vim-javascript'
  Plug 'plasticboy/vim-markdown'
  Plug 'aliva/vim-fish'
call plug#end()
"-------------- Plugins Settings--------------

" easy align
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" easymotion
let g:EasyMotion_smartcase = 1
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" set airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='dark'
set laststatus=2

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" nerd tree
map <C-n> :NERDTreeToggle<CR>

" molokai & colors/italic/background
set t_Co=256
let g:molokai_original = 1
let g:rehash256 = 1
colo molokai
hi Normal ctermfg=252 ctermbg=none
hi Comment cterm=italic

" camel case
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

" rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>

" ctrl P
map <Leader>c :CtrlP<CR>

" ag
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_use_caching = 0
  let g:ctrlp_user_command = 'ag %s -l --nocolor --nogroup --column -g ""
    \ --ignore-dir "bin"
    \ --ignore-dir "coverage"
    \ --ignore-dir "data"
    \ --ignore-dir "design"
    \ --ignore-dir "doc"
    \ --ignore-dir "log"
    \ --ignore-dir "public"
    \ --ignore-dir "spec_old"
    \ --ignore-dir "studios"
    \ --ignore-dir "template"
    \ --ignore-dir "tmp"
    \ --ignore-dir "vendor"
    \ --ignore-dir "vendor"
    \ --ignore-dir "verificator"
    \ --ignore "*.log"
    \ --ignore "*tags"
    \ --ignore "db/schema*"'

  " AG
  map <Leader>g :Ag<SPACE>
  let g:ag_prg='ag -S --nocolor --nogroup --column
    \ --ignore-dir "bin"
    \ --ignore-dir "coverage"
    \ --ignore-dir "data"
    \ --ignore-dir "design"
    \ --ignore-dir "doc"
    \ --ignore-dir "log"
    \ --ignore-dir "public"
    \ --ignore-dir "spec_old"
    \ --ignore-dir "studios"
    \ --ignore-dir "template"
    \ --ignore-dir "tmp"
    \ --ignore-dir "vendor"
    \ --ignore-dir "vendor"
    \ --ignore-dir "verificator"
    \ --ignore "*.log"
    \ --ignore "*tags"
    \ --ignore "db/schema*"'
endif

" rails
map <Leader>.h :AV<CR>

" youcompleteme
let g:EclimCompletionMethod = 'omnifunc'

" ctags
map <Leader>.z :CtrlPTag<CR>
nmap <C-t> :TagbarToggle<CR>
map <Leader>.t :ta /^

" move
let g:move_key_modifier = 'C'

" fugitive
map <Leader>.s :Gstatus<CR>
map <Leader>.b :Gblame<CR>
map <Leader>.w :Gbrowse<CR>
map <Leader>.d :Gdiff<CR>
set diffopt+=vertical

" format json
nmap =j :%!python -m json.tool<CR>

" ale
let g:ale_linters = {
\   'ruby': ['ruby', 'reek', 'rubycop', 'brakeman', 'rails_best_practices'],
\}

let g:airline#extensions#ale#enabled = 1

let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_echo_msg_error_str = '☠ '
let g:ale_echo_msg_warning_str = '♿'
let g:ale_sign_error = '☠ '
let g:ale_sign_warning = '♿'
let g:ale_echo_msg_format = '[%linter%] %s'
"---------------------- End -----------------------------

highlight clear SpellBad
highlight SpellBad cterm=bold,italic ctermfg=014 ctermbg=000

" I got up at 8 AM
" wordy
let g:wordy#ring = [
  \ 'weak',
  \ ['being', 'passive-voice', ],
  \ 'business-jargon',
  \ 'weasel',
  \ 'puffery',
  \ ['problematic', 'redundant', ],
  \ ['colloquial', 'idiomatic', 'similies', ],
  \ 'art-jargon',
  \ ['contractions', 'opinion', 'vague-time', 'said-synonyms', ],
  \ 'adjectives',
  \ 'adverbs',
  \ ]


" autocorrect
ia shipmnet shipment
ia Shipmnet Shipment
