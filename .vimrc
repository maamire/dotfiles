"  ============================================================================
"
"                     _    ________  ___   ____  ______
"                    | |  / /  _/  |/  /  / __ \/ ____/
"                    | | / // // /|_/ /  / /_/ / /
"                    | |/ // // /  / /  / _, _/ /___
"                    |___/___/_/  /_/  /_/ |_|\____/
"
"  ============================================================================






    "" ========================================================================
    ""                          Mapleader
    "" ========================================================================

    let mapleader = " "
    let maplocalleader= "\\"
    set timeoutlen=500

    "" ========================================================================
    ""                          Plug
    "" ========================================================================

    call plug#begin()

    Plug 'jaredgorski/spacecamp'

    Plug 'lervag/vimtex'
    Plug 'sirver/ultisnips'

    Plug 'vim-airline/vim-airline'

    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'

    Plug 'airblade/vim-gitgutter'

    Plug 'dense-analysis/ale'
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'lifepillar/vim-mucomplete'


    Plug 'chrisbra/Colorizer'
    call plug#end()



    "" ========================================================================
    ""                          Vimtex
    "" ========================================================================

    let g:vimtex_view_method= 'zathura'
    let g:vimtex_compiler_method='latexmk'
    let g:vimtex_quickfix_mode=0
    let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

    "" ========================================================================
    ""                          UltiSnips
    "" ========================================================================

    let g:UltiSnipsExpandTrigger       = '<C-j>'
    let g:UltiSnipsJumpForwardTrigger  = '<C-j>'
    let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

    "" ========================================================================
    ""                          ALE
    "" ========================================================================

    let g:ale_enabled = 1

    let g:ale_set_sign = 0

    let g:ale_lint_on_text_changed = 'normal'
    let g:ale_lint_on_insert_leave = 1
    let g:ale_fix_on_save = 1
    let g:ale_lint_delay = 0

    let g:ale_open_list = 0
    let g:ale_list_window_size = 5
    let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

    let g:ale_fixers = {
    \   '*': ['remove_trailing_lines', 'trim_whitespace'],
    \}

    au VimEnter,BufEnter,ColorScheme *
      \ exec "hi! ALEInfoLine
        \ guifg=".(&background=='light'?'#808000':'#ffff00')."
        \ guibg=".(&background=='light'?'#ffff00':'#555500') |
      \ exec "hi! ALEWarningLine
        \ guifg=".(&background=='light'?'#808000':'#ffff00')."
        \ guibg=".(&background=='light'?'#ffff00':'#555500') |
      \ exec "hi! ALEErrorLine
        \ guifg=".(&background=='light'?'#ff0000':'#ff0000')."
        \ guibg=".(&background=='light'?'#ffcccc':'#550000')

    "" ========================================================================
    ""                          GitGutter
    "" ========================================================================

    let g:gitgutter_sign_priority = 10

    let g:gitgutter_sign_added = '+'
    let g:gitgutter_sign_modified = '~'
    let g:gitgutter_sign_removed = '-'

    let g:gitgutter_realtime = 0
    let g:gitgutter_eager = 0

    "" ========================================================================
    ""                          GutenTags & Completion
    "" ========================================================================

    let g:mucomplete#enable_auto_at_startup = 1
    let g:gutentags_cache_dir = expand('~/.cache/tags')
    let g:gutentags_generate_on_new = 1
    let g:gutentags_generate_on_missing = 1
    let g:gutentags_generate_on_write = 1
    let g:gutentags_generate_on_empty_buffer = 0

    let g:gutentags_project_root = ['.git', '.hg', '.svn', 'Makefile', 'CMakeLists.txt']
    let g:gutentags_ctags_exclude = ['*.git', '*.svn', '*.svg', '*.hg', '*/tests/*', 'build', 'dist', 'node_modules']

    if executable('uctags')
        let g:gutentags_ctags_executable = 'uctags'
    endif

    set completeopt=menuone,noinsert,noselect
    set shortmess+=c

    inoremap <C-Space> <C-n>

    "" ========================================================================
    ""                          Fzf
    "" ========================================================================

    nnoremap <leader>f :Files<CR>
    nnoremap <leader>b :Buffers<CR>
    nnoremap <leader>/ :Rg<CR>
    nnoremap <leader>t :Tags<CR>

    "" ========================================================================
    ""                          Basics
    "" ========================================================================

    set nocompatible
    syntax on
    set number relativenumber
    set ruler
    set mouse=a
    set visualbell
    set clipboard=unnamedplus
    set backspace=indent,eol,start
    set hidden
    set noswapfile
    set nobackup
    set undodir=~/.vim/undodir
    set undofile
    set signcolumn=yes


    set splitbelow splitright "split right

    ""set textwidth=80
    ""set wrap
    set nowrap
    set nofixendofline
    set lazyredraw

    "" Remove Trailing Whitespaces
    command! FixWhitespace :%s/\s\+$//e
    set guiheadroom=0


    set wildmenu
    set wildmode=list:longest,full

    nnoremap x "_x
    vnoremap x "_x

    "" ========================================================================
    ""                          Cursor
    "" ========================================================================

    set cursorline
    set cursorcolumn
    set scrolloff=8
    set colorcolumn=80
    hi ColorColumn ctermbg=darkgray

    "" ========================================================================
    ""                          Search
    "" ========================================================================

    set incsearch
    set hlsearch
    set ignorecase
    set smartcase
    set matchtime=0
    nnoremap <silent><leader>h :nohlsearch<CR>
    filetype plugin indent on

    "" ========================================================================
    ""                          Tabs & Indentation
    "" ========================================================================

    set expandtab
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    set autoindent
    set smartindent


    "" ========================================================================
    ""                              Brackets
    "" ========================================================================

    inoremap " ""<left>
    inoremap ' ''<left>
    inoremap ( ()<left>
    inoremap [ []<left>
    inoremap { {}<left>
    inoremap {<CR> {<CR>}<ESC>O
    inoremap {;<CR> {<CR>};<ESC>O

    "" ========================================================================
    ""                              File templates
    "" ========================================================================

    if has("autocmd")
      augroup templates
        autocmd!
        autocmd BufNewFile *.py 0r ~/.vim/skeletons/python.py | normal! G
        autocmd BufNewFile *.cpp 0r ~/.vim/skeletons/cpp.cpp | normal! G
        autocmd BufNewFile *.c 0r ~/.vim/skeletons/c.c | normal! G
        autocmd BufNewFile *.h 0r ~/.vim/skeletons/cheader.h | normal! G
        autocmd BufNewFile *.html 0r ~/.vim/skeletons/html.html | normal! G
        autocmd BufNewFile *.sh 0r ~/.vim/skeletons/bash.sh | normal! G
      augroup END
    endif


    "" ========================================================================
    ""                              Colors
    "" ========================================================================
    colorscheme spacecamp
    set showmatch
    hi MatchParen ctermfg=yellow  ctermbg=bg
    set laststatus=2
