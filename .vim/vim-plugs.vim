call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf',  {'dir': '~/.fzf', 'do': './install --bin'} | Plug 'junegunn/fzf.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'kana/vim-textobj-user'
Plug 'glts/vim-textobj-comment'
Plug 'wellle/targets.vim'
Plug 'kana/vim-operator-user'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'junegunn/vim-easy-align'
Plug 'habamax/vim-sendtoterm'
Plug 'dstein64/vim-startuptime', {'on': ['StartupTime']}
Plug 'tpope/vim-repeat'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-python/python-syntax'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'mbbill/undotree', {'on': ['UndotreeToggle']}
call plug#end()
