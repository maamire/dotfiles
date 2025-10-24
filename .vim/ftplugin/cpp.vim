" ===============================
" C++ Specific ALE Configuration
" ===============================

" C++ linters
let b:ale_linters = ['clang', 'cppcheck', 'clangtidy', 'cpplint']

" C++ fixers
let b:ale_fixers = ['clang-format', 'clangtidy', 'remove_trailing_lines', 'trim_whitespace']

" C++ compiler options
let b:ale_cpp_clang_options = '-std=c++20 -Wall -Wextra -O2'
let b:ale_cpp_gcc_options = '-std=c++20 -Wall -Wextra -O2'

" Build directory detection
let b:ale_c_build_dir_names = ['build', 'bin', 'Debug', 'Release', 'cmake-build-debug']


" clang-format configuration
let b:ale_cpp_clangformat_options = '-style=file'

setlocal cindent
setlocal cinoptions=g0,:0,N-s,(0
setlocal commentstring=//\ %s

" Compile shortcut
nnoremap <buffer> <F5> :w<CR>:!clear && g++ -std=c++20 -O2 -o %< % && ./%<<CR>
nnoremap <buffer> <F6> :w<CR>:!clear && g++ -std=c++20 -g -o %<_debug % && gdb ./%<_debug<CR>
