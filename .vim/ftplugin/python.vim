"" Formatting
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal expandtab
setlocal autoindent
setlocal commentstring=#\ %s

"" Ale
let b:ale_linters = ['pylint', 'flake8', 'mypy', 'bandit']
let b:ale_fixers = ['black', 'isort', 'remove_trailing_lines', 'trim_whitespace']


""setlocal textwidth=88
setlocal colorcolumn=88

"" Shortcuts
nnoremap <buffer> <F5> :w<CR>:!clear && python3 %<CR>
nnoremap <buffer> <F6> :w<CR>:!clear && python3 -m pdb %<CR>
nnoremap <buffer> <F7> :w<CR>:!clear && python3 -m pytest %<CR>

nnoremap <buffer> <leader>ip :!clear && ipython3 -i %<CR>
nnoremap <buffer> <leader>in :!jupyter notebook<CR>
