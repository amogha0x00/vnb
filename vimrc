au BufNewFile * silent! 0r $HOME/.vim/templates/%:e.skeleton
au BufRead,BufNewFile *.ipy setlocal filetype=python
"au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
"au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
"set fileformat=unix
syntax on
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4.
set softtabstop=4   " Sets the number of columns for a TAB.
set expandtab       " Expand TABs to spaces.
set autoindent      " Auto intends
set smartindent
set number
set relativenumber

if has("autocmd")
    au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
    au InsertEnter,InsertChange * 
        \ if v:insertmode == 'i' |
        \   silent execute '!echo -ne "\e[5 q"' | redraw! |
        \ elseif v:insertmode == 'r' |
        \   silent execute '!echo -ne "\e[3 q"' | redraw! |
        \ endif 
    au VimLeave * silent execute 'echo -ne "\e[ q"' | redraw!
endif

au FileType c inoremap <F8> <Esc>:w<CR>:!clear;gcc % -o %< -lm -Wall && ./%<<CR>
au FileType c nnoremap <F8> :w<CR>:!clear;gcc % -o %< -lm -Wall && ./%<<CR>
au FileType python inoremap <F8> <Esc>:w<CR>:!clear;python3 %<CR>
au FileType python nnoremap <F8> :w<CR>:!clear;python3 %<CR>

map <F6> :setlocal spell! spelllang=en_us<CR>
cmap suw w !sudo tee % > /dev/null

vnoremap <C-c> :w !xclip -i -sel c<CR><CR>
vnoremap <C-x> "+d

nnoremap <C-v> "+P<CR> 
inoremap <C-v> <Esc>"+P<CR>i
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {<CR><BS>}<Esc>ko
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap <C-j> <Esc>/[)}"'\]>]<CR>:nohl<CR>a
inoremap <C-k> <Esc>?[)}"'\]>]<CR>:nohl<CR>a
