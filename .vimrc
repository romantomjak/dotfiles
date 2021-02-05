" How many lines of history VIM will remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Re-read file on external changes
set autoread

" :W sudo saves the file - usefeul when you get the permission denied error
command W w !sudo tee % > /dev/null

" Set 8 lines to the cursor - when moving vertically using j/k
set so=8

" Always show current position
set ruler

" Ignore case when searching, but be smart about it
set ignorecase
set smartcase

" Highlight search results
set hlsearch

" Show search matches as the pattern is being typed
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
set softtabstop=4 

" Show line numbers
set number

" Turn on spell checker
set spell

" Show all whitespace and line continuation characters
set showbreak=↪\
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨,tab:▸\ ,space:␣

" Toggle NERDTree with CTRL+n
map <C-n> :NERDTreeToggle<CR>

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Add fzf to Vim's runtimepath. This adds the :Files command
set rtp+=/usr/local/opt/fzf

" Define a custom :Files command to search file names
command! -bang -nargs=* Files call fzf#vim#grep('rg --files --no-ignore --ignore-case --hidden --follow --glob "!.git/" --glob "!.pytest_cache/" --glob "!*__pycache__*" --glob "!.eggs/" --glob "!*.egg-info/" . '.shellescape(<q-args>), 1, <bang>0)

" Make CTRL+F execute :Files command
nnoremap <C-f> :Files<cr>

" Define a custom :Find command to search file content
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always" --glob "!.git/" --glob "!.pytest_cache/" --glob "!*__pycache__*" --glob "!.eggs/" --glob "!*.egg-info/" --glob "!.coverage" '.shellescape(<q-args>), 1, <bang>0)

" Make CTRL+P execute :Find aka rg aka 'poor mans symbol search'
nnoremap <C-p> :Find<cr>
