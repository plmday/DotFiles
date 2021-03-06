" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim72/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

syntax on
"set number
set softtabstop=2
set shiftwidth=2
set expandtab
"set textwidth=78

map j gj
map k gk
nmap :Q :qa
nmap :W :wa

if &diff
  autocmd CursorMoved,CursorMovedI * diffupdate
" colorscheme evening
" highlight! link DiffText MatchParen
" set diffopt+=iwhite
endif

set background=dark " dark | light "
colorscheme solarized

"set formatprg=par\ 78j
