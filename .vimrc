" How many lines of history VIM will remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Re-read file on external changes
set autoread

" :W sudo saves the file - usefeul when you get the permission denied error
command W w !sudo tee % > /dev/null

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Always show current position
set ruler

" Ignore case when searching, but be smart about it
set ignorecase
set smartcase

" Highlight search results
set hlsearch

" Make search act like search in modern browsers
set incsearch

" Enable syntax highlighting
syntax enable
colorscheme pablo
set background=dark

" Set utf8 as default encoding
set encoding=utf8

" Use unix as the standard file type
set ffs=unix,dos,mac

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab is 4 spaces
set shiftwidth=4
set tabstop=4

" NERDTree shortcut
map <C-n> :NERDTreeToggle<CR>

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Add fzf to Vim's runtimepath. This adds the :Files command
set rtp+=/usr/local/opt/fzf

" Make CTRL+F execute :Files command
nnoremap <C-f> :Files<cr>

" Define a custom :Find command to search file content
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" Make CTRL+P execute :Find aka rg aka 'poor mans symbol search'
nnoremap <C-p> :Find<cr>
