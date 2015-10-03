execute pathogen#infect()

syntax enable
set background=light
colorscheme solarized

set encoding=utf8
set ruler
set nu
set visualbell
set autoindent
set hlsearch
set incsearch
set showmatch
set mat=2
set so=5


filetype on
:autocmd Filetype python setlocal tabstop=4 softtabstop=4 expandtab shiftwidth=4 shiftround foldmethod=indent foldignore=""
:autocmd Filetype txt setlocal tabstop=4 softtabstop=4 expandtab shiftwidth=4 shiftround foldmethod=indent
:autocmd Filetype html setlocal tabstop=2 softtabstop=2 expandtab shiftwidth=2 shiftround foldmethod=indent
:autocmd Filetype R setlocal tabstop=2 softtabstop=2 expandtab shiftwidth=2 shiftround
:autocmd Filetype r setlocal tabstop=2 softtabstop=2 expandtab shiftwidth=2 shiftround
:autocmd Filetype javascript setlocal tabstop=2 softtabstop=2 expandtab shiftwidth=2 shiftround
:autocmd Filetype c setlocal tabstop=4 softtabstop=4 expandtab shiftwidth=4 shiftround
:autocmd Filetype julia setlocal tabstop=2 softtabstop=2 expandtab shiftwidth=2 shiftround
:autocmd Filetype julia setlocal tabstop=2 softtabstop=2 expandtab shiftwidth=2 shiftround
:autocmd Filetype tex setlocal tabstop=2 softtabstop=2 expandtab shiftwidth=2 shiftround tw=80
:autocmd Filetype plaintex setlocal tabstop=2 softtabstop=2 expandtab shiftwidth=2 shiftround tw=80

" Toggle relative line numbers
nnoremap <silent><leader>n :set rnu! rnu? <cr>
" In visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f')<cr>
vnoremap <silent> # :call VisualSelection('b')<cr>

" Tab management
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmoved
" split management
map <leader>hs :split<cr>
map <leader>vs :vsplit<cr>

" Helper function for visual search
function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
