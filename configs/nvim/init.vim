set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set noerrorbells
set relativenumber
set nu
set nohlsearch
set hidden
set nowrap
set ignorecase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set colorcolumn=120
set signcolumn=yes
set termguicolors

call plug#begin('~/.nixconf/configs/nvim/plugged')
Plug 'savq/melange'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'mbbill/undotree'
Plug 'williamboman/mason.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason-lspconfig.nvim'
call plug#end()

colorscheme melange
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

nnoremap <F5> :UndotreeToggle<CR>

lua require("mason").setup()
lua require("mason-lspconfig").setup()

