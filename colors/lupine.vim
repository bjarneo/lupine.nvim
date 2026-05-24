" Lupine colorscheme for Vim/Neovim
" Maintainer: Bjarne Øverli
" License: MIT

" Neovim-only Lua colorscheme
if !has('nvim')
  echohl ErrorMsg
  echom "lupine.nvim requires Neovim"
  echohl None
  finish
endif

lua require('lupine').load()