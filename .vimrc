"  ============================================================================
"
"                     _    ________  ___   ____  ______
"                    | |  / /  _/  |/  /  / __ \/ ____/
"                    | | / // // /|_/ /  / /_/ / /
"                    | |/ // // /  / /  / _, _/ /___
"                    |___/___/_/  /_/  /_/ |_|\____/
"
"
"  ============================================================================






    "" ========================================================================
    ""                          mapleader
    "" ========================================================================

    let mapleader = " "
    let maplocalleader= '\'
    set timeoutlen=500

    "" ========================================================================
    ""                          Plug
    "" ========================================================================

    call plug#begin()

    Plug 'lervag/vimtex'
    Plug 'sirver/ultisnips'
    Plug 'vim-airline/vim-airline'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-commentary'

    ""# Lsp
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'
    call plug#end()

    function! s:on_lsp_buffer_enabled() abort
        setlocal omnifunc=lsp#complete
    endfunction


    augroup lsp_install
        au!
        autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
    augroup END
    "" ========================================================================
    ""                          vimtex
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



    let g:UltiSnipsExpandTrigger       = '<Tab>'    " use Tab to expand snippets
    let g:UltiSnipsJumpForwardTrigger  = '<Tab>'    " use Tab to move forward through tabstops
    let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'  " use Shift-Tab to move backward through tabstops


    "" ========================================================================
    ""                          Basics
    "" ========================================================================

    set nocompatible
    syntax on
    set number relativenumber
    set ruler
    set mouse=a
    set visualbell
    set clipboard=unnamed
    set backspace=indent,eol,start
    set hidden
    set noswapfile
    set nobackup
    set undodir=~/.vim/undodir
    set undofile
    set signcolumn=yes

    set splitbelow splitright "split rigth

    ""set textwidth=80
    ""set wrap
    set nowrap

    "" Remove Trailing Whitespaces
    command! FixWhitespace :%s/\s\+$//e


    "" ========================================================================
    ""                          Cursor
    "" ========================================================================

    set cursorline
    set cursorcolumn
    set scrolloff=999

    "" ========================================================================
    ""                          Search
    "" ========================================================================

    set incsearch
    set hlsearch
    set matchtime=0
    nnoremap <silent><leader>h :nohlsearch<CR>
    filetype plugin indent on

    "" ========================================================================
    ""                          tabs & indentation
    "" ========================================================================

    set expandtab
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    set autoindent
    set smartindent


    "" ========================================================================
    ""                              brackets
    "" ========================================================================

    inoremap " ""
    inoremap ' ''
    inoremap ( ()
    inoremap [ []
    inoremap { {}
    inoremap {<CR> {<CR>}<ESC>O
    inoremap {;<CR> {<CR>};<ESC>O

    "" ========================================================================
    ""                              colors
    "" ========================================================================
    colorscheme spacecamp
    set showmatch
    hi MatchParen ctermfg=yellow  ctermbg=bg
    set laststatus=2
