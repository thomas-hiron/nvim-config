set hidden
nnoremap <Up> :resize -10<cr>
nnoremap <Down> :resize +10<cr>
nnoremap <Left> :vertical resize -10<cr>
nnoremap <Right> :vertical resize +10<cr>
set nocompatible
set scrolloff=3
set number relativenumber
set nrformats-=octal
set formatoptions-=t " do not automatically wrap text when typing
set textwidth=0 " do not automatically wrap text when typing
filetype on
filetype indent on
set mouse=a
let mapleader = ","

" Indent
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab shiftround autoindent " Indentation configuration
autocmd FileType lua setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType yaml setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab

set signcolumn=yes " Always show the sign column

" List chars displayed as guides
set list
set listchars=
set listchars+=tab:<->
set listchars+=eol:¬
set listchars+=trail:⋅
set listchars+=lead:⋅

" Allow project specific .vimrc
set exrc
set secure

" Easymotion
let g:EasyMotion_do_mapping = 0
nnoremap <leader>j <Plug>(easymotion-w)
nnoremap <leader>k <Plug>(easymotion-b)

" Telescope mapping
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fa <cmd>Telescope find_files no_ignore=true<cr>
nnoremap <expr> <leader>fd ':Telescope find_files<cr>' . "'" . expand('<cword>')
nnoremap <leader>fg <cmd>Telescope live_grep_args<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fr <cmd>Telescope registers<cr>
nnoremap <leader>fo <cmd>Telescope oldfiles cwd_only=true<cr>
nnoremap <leader>fs <cmd>Telescope resume<cr>
vnoremap <leader>fv <cmd>lua require("telescope-live-grep-args.shortcuts").grep_visual_selection()<cr>
nnoremap <leader>fw <cmd>lua require("telescope-live-grep-args.shortcuts").grep_word_under_cursor()<cr>
nnoremap <leader>fy <cmd>YAMLTelescope<cr>
nnoremap gd <cmd>Telescope lsp_definitions<cr>
nnoremap gr <cmd>Telescope lsp_references<cr>
nnoremap gi <cmd>Telescope lsp_implementations<cr>
nnoremap gs <cmd>Telescope lsp_document_symbols<cr>

" LSP mapping
nnoremap K <cmd>lua vim.lsp.buf.hover()<cr>
nnoremap <leader>rr <cmd>lua vim.lsp.buf.rename()<cr>
nnoremap <leader>ra <cmd>lua vim.lsp.buf.code_action()<cr>
vnoremap <leader>ra <cmd>lua vim.lsp.buf.code_action()<cr>

" Tree maping
nnoremap <leader>tt <cmd>NvimTreeToggle<cr>
nnoremap <leader>tf <cmd>NvimTreeFindFile<cr>
nnoremap <leader>tr <cmd>NvimTreeRefresh<cr>

" Git
nnoremap <leader>gb <cmd>Git blame<cr>
nnoremap <leader>gd <cmd>Gvdiffsplit<cr>

" Symfony
nnoremap <leader>s <cmd>SymfonyGoto<cr>

" Snippets
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

" Buffers
nnoremap œ <cmd>BufferPrevious<cr>
nnoremap æ <cmd>BufferNext<cr>
nnoremap <leader>bc <cmd>BufferClose<cr>
nnoremap <leader>br <cmd>BufferRestore<cr>
nnoremap <leader>bp <cmd>BufferPick<cr>
nnoremap <leader>bxl <cmd>BufferCloseBuffersLeft<cr>
nnoremap <leader>bxr <cmd>BufferCloseBuffersRight<cr>

" Others
nnoremap J mzJ`z " Keep the cursor in place while joining lines
map q: :q
nnoremap <leader>w <cmd>ArgWrap<cr>
nnoremap <leader>mp <cmd>MarkdownPreview<cr>
nnoremap <leader>yk <cmd>YAMLYankKey<cr>
nnoremap <leader>yv <cmd>YAMLYankValue<cr>
nnoremap â :bdelete<cr>
nnoremap ç :cprev<cr>
nnoremap å :cnext<cr>
nnoremap ± :w<cr>

" autocmd
if has('nvim')
  autocmd BufReadPost * call general#RestoreCursorPosition()
  autocmd BufWrite *.php,*.js,*.twig,*.html,*.sh,*.yaml,*.yml,*.vim,*.lua,*.feature call general#DeleteTrailingSpace()
end

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

" Global plugins
Plug 'akinsho/toggleterm.nvim'
Plug 'alvan/vim-php-manual'
Plug 'cuducos/yaml.nvim'
Plug 'easymotion/vim-easymotion'
Plug 'folke/which-key.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
Plug 'lewis6991/gitsigns.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'nvim-telescope/telescope-live-grep-args.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'romgrk/barbar.nvim'
Plug 'RRethy/vim-illuminate'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'stevearc/dressing.nvim'
Plug 'thomas-hiron/symfony-goto.nvim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'windwp/nvim-autopairs'
Plug 'https://git.foosoft.net/alex/vim-argwrap.git'

" Aucomplete plugins
Plug 'hrsh7th/cmp-buffer' " Autocomplete with words in current buffer
Plug 'hrsh7th/cmp-nvim-lsp' " LSP integration
Plug 'hrsh7th/cmp-path' " Autocomplete for system path
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind.nvim' " Additional contextual menu info
Plug 'SergioRibera/cmp-dotenv'
Plug 'thomas-hiron/cmp-html-class'
Plug 'thomas-hiron/cmp-symfony-routes'
Plug 'thomas-hiron/cmp-twig'

" Snippets plugins
Plug 'hrsh7th/vim-vsnip'
Plug 'SirVer/ultisnips'

" Indent plugins (don't sort, vim-polyglot must be loaded first)
Plug 'sheerun/vim-polyglot'
Plug 'lumiliet/vim-twig'

" Theme plugins
Plug 'sainnhe/edge'

" Mason
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'williamboman/mason.nvim'

call plug#end()

if has('nvim')
  lua require('config')
endif
