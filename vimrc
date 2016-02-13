"------------------- Vim settings -----------------------
" autosave view
set viewoptions-=options
augroup vimrc
    autocmd BufWritePost *
    \   if expand('%') != '' && &buftype !~ 'nofile'
    \|      mkview
    \|  endif
    autocmd BufRead *
    \   if expand('%') != '' && &buftype !~ 'nofile'
    \|      silent loadview
    \|  endif
augroup END

au BufWritePre * :%s/\s\+$//e       " trailing whitespaces

set shell=/bin/bash
set clipboard=unnamed,unnamedplus   " use system clipboard
set tags+=gems.tags                 " ctags
set nu                              " enable left numbers
set fillchars=vert:\                " disable vert div chars
set nocompatible                    " be iMproved, required
set cursorline                      " highlight the cursor screen line "
set scrolloff=5                     " minimal number of screen lines to keep above and below the cursor "
set spell spelllang=en_us           " spellchecker

" Auto indentation
set expandtab
set shiftwidth=2
set softtabstop=2

" String to put at the start of lines that have been wrapped "
let &showbreak='↪ '

" remap colon
map ; :

" remap esc
imap jj <Esc>

" leader
let mapleader=","

"---------------- Plugins -------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'L9'
  Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
  Plugin 'gmarik/Vundle.vim'

  " Navigation
  Plugin 'bkad/CamelCaseMotion'
  Plugin 'Lokaltog/vim-easymotion'
  Plugin 'scrooloose/nerdtree'
  Plugin 'ctrlpvim/ctrlp.vim'
  Plugin 'rking/ag.vim'
  Plugin 'majutsushi/tagbar'

  " Correction
  Plugin 'scrooloose/syntastic'
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'junegunn/vim-easy-align'
  Plugin 'ntpeters/vim-better-whitespace'
  Plugin 'Raimondi/delimitMate'

  " Appearance
  Plugin 'tomasr/molokai'
  Plugin 'airblade/vim-gitgutter'
  Plugin 'kshenoy/vim-signature'
  Plugin 'Bling/vim-airline'
  Plugin 'gorodinskiy/vim-coloresque'
  Plugin 'tpope/vim-fugitive'

  " Objects
  Plugin 'kana/vim-textobj-user'
  Plugin 'glts/vim-textobj-comment'

  " General editing
  Plugin 'tpope/vim-surround'
  Plugin 'tomtom/tcomment_vim'

  " Ruby/Rails
  Plugin 'tpope/vim-endwise'
  Plugin 'tpope/vim-rails'
  Plugin 'vim-ruby/vim-ruby'
  Plugin 'AndrewRadev/switch.vim'
  Plugin 'thoughtbot/vim-rspec'

  " Window Management
  Plugin 'ZoomWin'

  " Languages
  Bundle 'slim-template/vim-slim.git'
  Plugin 'kchmck/vim-coffee-script'
  Plugin 'nginx.vim'
  Plugin 'zaiste/tmux.vim'
  Plugin 'elzr/vim-json'
  Plugin 'TAKAyukiatkwsk/vim-mongoid-syntax'
  Plugin 'pangloss/vim-javascript'
  Plugin 'plasticboy/vim-markdown'
  Plugin 'aliva/vim-fish'
call vundle#end()
syntax enable
filetype plugin indent on

"-------------- Plugins Settings--------------

" easy align
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

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

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='☠'
let g:syntastic_warning_symbol='☣'
let g:syntastic_style_error_symbol='྾'
let g:syntastic_style_warning_symbol='♿'

let g:syntastic_enable_coffee_checker = 1
let g:syntastic_enable_css_checker = 1
let g:syntastic_enable_haml_checker = 1
let g:syntastic_enable_javascript_checker = 1
let g:syntastic_enable_markdown_checker = 1
let g:syntastic_enable_sass_checker = 1
let g:syntastic_enable_scss_checker = 1
let g:syntastic_enable_sh_checker = 1
let g:syntastic_enable_slim_checker = 1
let g:syntastic_enable_yaml_checker = 1
let g:syntastic_coffee_checkers = ['coffee', 'coffeelint']
let g:syntastic_css_checkers = ['csslint', 'phpcs', 'prettycss', 'recess', 'stylelint']
let g:syntastic_haml_checkers = ['haml', 'haml_lint']
let g:syntastic_html_checkers = ['jshint', 'tidy', 'validator', 'w3*']
let g:syntastic_javascript_checkers = ['closurecompiler', 'gjslint', 'standard']
let g:syntastic_ruby_checkers = ['mri', 'rubocop', 'rubylint', 'reek', 'flog']
let g:syntastic_sass_checkers = ['sass', 'sassc']
let g:syntastic_scss_checkers = ['sass', 'sassc', 'scss_lint']
let g:syntastic_sh_checkers = ['bashate', 'checkbashisms', 'sh', 'shellcheck']
let g:syntastic_slim_checkers = ['slimrb']
let g:syntastic_spec_checkers = ['rpmlint']
let g:syntastic_yaml_checkers = ['jsyaml', 'yamlxs']

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg)
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:bg .' guifg='. a:fg
endfunction

call NERDTreeHighlightFile('rb', "DarkRed", 'none')
call NERDTreeHighlightFile('coffee', "DarkMagenta", 'none')
call NERDTreeHighlightFile('sass', "Cyan", 'none')
call NERDTreeHighlightFile('slim', "Yellow", 'none')
call NERDTreeHighlightFile('html', "DarkGray", 'none')
call NERDTreeHighlightFile('txt', "DarkBlue", 'none')
call NERDTreeHighlightFile('log', "lightGreen", 'none')
call NERDTreeHighlightFile('yml', "DarkYellow", 'none')
call NERDTreeHighlightFile('Gemfile', "DarkGreen", 'none')
call NERDTreeHighlightFile('Guard', "DarkGreen", 'none')
call NERDTreeHighlightFile('Capfile', "DarkGreen", 'none')

" camel case
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

" switch
autocmd FileType ruby let b:switch_custom_definitions =
    \ [
    \   {
    \     ':\(\k\+\)\s\+=>': '\1:',
    \     '\<\(\k\+\):':     ':\1 =>',
    \   },
    \ ]
" tagbar
nmap <C-t> :TagbarToggle<CR>

" rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" ctrl P
map <Leader>c :CtrlP<CR>
set wildignore+=*/tmp/*,*.so,*.swp,*.log,*/vendor/*,*/public/*,*/coverage/*,*tags,*/bin/*

" AG
map <Leader>g :Ag<SPACE>
let g:ag_prg='ag -S --nocolor --nogroup --column
\ --ignore "./public/**"
\ --ignore "./vendor/**"
\ --ignore "./tmp/**"
\ --ignore "./coverage/**"
\ --ignore "*.log"
\ --ignore "./db/migrate/**"
\ --ignore "./db/schema.rb"
\ --ignore "*tags"'

" youcompleteme
let g:EclimCompletionMethod = 'omnifunc'

"---------------------- End -----------------------------
