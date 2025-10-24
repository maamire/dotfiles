let b:ale_linters = ['clang', 'cppcheck']
let b:ale_fixers = ['clang-format', 'remove_trailing_lines', 'trim_whitespace']

let b:ale_c_clang_options = '-std=c11 -Wall -Wextra -O2'
let b:ale_c_gcc_options = '-std=c11 -Wall -Wextra -O2'

let b:ale_c_build_dir_names = ['build', 'bin', 'Debug', 'Release']

setlocal cindent
setlocal commentstring=/*\ %s\ */

" Compile and run
nnoremap <buffer> <F5> :w<CR>:!clear && gcc -std=c11 -O2 -o %< % && ./%<<CR>
nnoremap <buffer> <F6> :w<CR>:!clear && gcc -std=c11 -g -o %<_debug % && gdb ./%<_debug<CR>
