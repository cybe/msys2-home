syntax enable
let base16colorspace=256
colorscheme base16-ocean

hi Normal ctermbg=none
hi NonText ctermbg=none
hi LineNr ctermbg=none

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

set modeline

for f in split(glob('/etc/vim/vimrc.local.d/*.vim'), '\n')
    exe 'source' f
endfor
