syntax on
filetype on
:set number
:set ruler
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set incsearch
:set wildmenu
:set guicursor=v-c-sm:block,n-i-ci-ve:ver25,r-cr-o:hor20

"***
"** Last Position
"*
autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif
