"------------------- Vim settings -----------------------
" autosave view
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  au BufRead,BufNewFile *.erb set filetype=eruby.html
endif
" set t_ZH=^[[3m
" set t_ZR=^[[23m

set t_ut=                " fix 256 colors in tmux http://sunaku.github.io/vim-256color-bce.html

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

" define a path to store persistent undo files.
let target_path = expand('~/.vim/persisted-undo/')
" create the directory and any parent directories
" if the location does not exist.
if !isdirectory(target_path)
  call system('mkdir -p ' . target_path)
endif
" point Vim to the defined undo directory.
let &undodir = target_path
" finally, enable undo persistence.
set undofile

" Auto indentation
set expandtab
set shiftwidth=2
set softtabstop=2

let g:ruby_indent_access_modifier_style="indent"
let g:ruby_indent_assignment_style="variable"

" String to put at the start of lines that have been wrapped "
let &showbreak='↪ '


" jump to end of text you pasted
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" " remap esc
" imap jj <Esc>
" remap colon
map ; :

" leader
let mapleader=","

"---------------- Plugins -------------------
call plug#begin('~/.vim/plugged')
  Plug 'vim-scripts/L9'

  " Navigation
  Plug 'chaoren/vim-wordmotion'
  Plug 'Lokaltog/vim-easymotion'
  Plug 'scrooloose/nerdtree'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'rking/ag.vim'
  Plug 'majutsushi/tagbar'
  Plug 'matze/vim-move'

  " Correction
  Plug 'w0rp/ale'
  Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }
  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif
  if has('win32') || has('win64')
    Plug 'tbodt/deoplete-tabnine', { 'do': 'powershell.exe .\install.ps1' }
  else
    Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
  endif

  Plug 'ntpeters/vim-better-whitespace'
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
  Plug 'konfekt/fastfold'

  " Objects
  Plug 'kana/vim-textobj-user'
  Plug 'glts/vim-textobj-comment'
  Plug 'noprompt/vim-yardoc'

  " General editing
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tomtom/tcomment_vim'
  Plug 'mattn/emmet-vim'
  Plug 'mattn/webapi-vim'
  Plug 'mattn/gist-vim'

  " Ruby/Rails
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-rails'
  Plug 'vim-ruby/vim-ruby'
  Plug 'AndrewRadev/switch.vim'
  Plug 'janko-m/vim-test'
  Plug 'benmills/vimux'
  Plug 'danchoi/ruby_bashrockets.vim'

  " go
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

  " Languages
  Plug 'slim-template/vim-slim'
  Plug 'kchmck/vim-coffee-script'
  Plug 'chr4/nginx.vim'
  Plug 'zaiste/tmux.vim'
  Plug 'elzr/vim-json'
  Plug 'TAKAyukiatkwsk/vim-mongoid-syntax'
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'plasticboy/vim-markdown'
  Plug 'aliva/vim-fish'

  " Live editor
  Plug 'metakirby5/codi.vim'
call plug#end()
"-------------- Plugins Settings--------------

let g:deoplete#enable_at_startup = 1
" Use ALE and also some plugin 'foobar' as completion sources for all code.
call deoplete#custom#option('sources', {
\ '_': ['tabnine'],
\})

" call deoplete#custom#source('ale', 'rank', 150)
" call deoplete#custom#source('tabnine', 'rank', 99999999)
"
" call deoplete#custom#option('profile', v:true)
" call deoplete#enable_logging('DEBUG', 'deoplete.log')

" codi
" since it is fullscreen, I'd like a 50/50 split
let g:codi#width = winwidth(winnr()) / 2

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

" fastfold
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio']
    \ }

" note that if you are using Plug mapping you should not use `noremap` mappings.
nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent> gh <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> gr <Plug>(lcn-rename)

let g:ruby_fold = 1
" set foldlevelstart=3
set nofoldenable

" nerd tree
map <C-n> :NERDTreeToggle<CR>

" molokai & colors/italic/background
set t_Co=256
let g:molokai_original = 1
let g:rehash256 = 1
colo molokai
hi Normal ctermfg=252 ctermbg=none
hi Comment cterm=italic

" rspec
let test#strategy = {
  \ 'nearest': 'vimux',
  \ 'file':    'vimux',
  \ 'suite':   'vimux',
\}

map <Leader>t :TestFile<CR>
map <Leader>s :TestNearest<CR>


" ctrl P
map <Leader>c :CtrlP<CR>
map <Leader>na :CtrlP app/<CR>
map <Leader>nc :CtrlP app/controllers/<CR>
map <Leader>nm :CtrlP app/models/<CR>
map <Leader>nf :CtrlP frontend/<CR>
map <Leader>ns :CtrlP spec/<CR>


" ag
if executable('ag')
  let ignore_options = '
    \ --ignore-dir "bin"
    \ --ignore-dir "coverage"
    \ --ignore-dir "rspec"
    \ --ignore-dir "data"
    \ --ignore-dir "doc"
    \ --ignore-dir "log"
    \ --ignore-dir "tmp"
    \ --ignore-dir "vendor"
    \ --ignore-dir "middleware"
    \ --ignore-dir "verificator"
    \ --ignore-dir "node_modules"
    \ --ignore-dir "engines"
    \ --ignore "*tags"
    \ --ignore "Gemfile.lock"
    \ --ignore "Guarfile"
    \ --ignore "Procfile"
    \ --ignore "REVISION"
    \ --ignore "Yarn.lock"
    \ --ignore "config.ru"
    \ --ignore "options.reek"
    \ --ignore "overhaul-backend.sql"
    \ --ignore "overhaul-backend.sql.zip"
    \ --ignore "rspec_results.html"'


  " CtrlP
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_use_caching = 0
  let g:ctrlp_working_path_mode = 1
  let g:ctrlp_user_command = 'ag %s -l --nocolor --nogroup --column -g "" ' . ignore_options

  " AG
  map <Leader>g :Ag<SPACE>
  let g:ag_prg='ag -S --nocolor --nogroup --column ' . ignore_options
endif

" rails
map <Leader>.h :AV<CR>

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
let b:ale_linters = {
\   'ruby': ['ruby', 'reek', 'fasterer', 'rubycop'],
\   'javascript': ['eslint'],
\}

let g:airline#extensions#ale#enabled = 1

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
ia recepients recipients
ia timestapm timestamp

inoremap _ <C-]>_
inoremap . <C-]>.
inoremap - <C-]>-

" jsx
let g:jsx_pragma_required = 1


" vim rails

map <Leader>ra :A<CR>

let g:rails_projections = {
      \  "app/notification_management/models/*.rb": {
      \      "test": [
      \        "spec/models/{}_spec.rb"
      \      ]
      \   },
      \  "app/controllers/*_controller.rb": {
      \      "test": [
      \        "spec/requests/{}_request_spec.rb",
      \        "spec/controllers/{}_controller_spec.rb",
      \        "test/controllers/{}_controller_test.rb"
      \      ],
      \      "alternate": [
      \        "spec/requests/{}_request_spec.rb",
      \        "spec/controllers/{}_controller_spec.rb",
      \        "test/controllers/{}_controller_test.rb"
      \      ],
      \   },
      \   "spec/requests/*_request_spec.rb": {
      \      "command": "request",
      \      "alternate": "app/controllers/{}_controller.rb",
      \      "template": "require 'rails_helper'\n\n" .
      \        "RSpec.describe '{}' do\nend",
      \   },
      \ }

" fugitive
nnoremap <leader>pd :Gdiffsplit!<CR>
nnoremap <leader>ps :Gstatus<CR>
nnoremap <leader>ph :diffget //2<CR>
nnoremap <leader>pl :diffget //3<CR>
nnoremap <Leader>pb :Gblame<CR>
nnoremap <Leader>pw :Gbrowse<CR>
set diffopt+=vertical

" motion
nnoremap <C-d> db
