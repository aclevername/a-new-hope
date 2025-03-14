call plug#begin(stdpath('data') . '/plugged')

" === Plugin List ===

" Syntax highlighting and language support
Plug 'jjo/vim-cue' " Cue language syntax highlighting
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Go language support, auto-formatting, etc.
Plug 'pangloss/vim-javascript' " JavaScript syntax support
Plug 'maxmellon/vim-jsx-pretty' " JSX syntax highlighting
Plug 'hashivim/vim-terraform' " Terraform syntax highlighting and tools

" Navigation and file management
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy finder
Plug 'junegunn/fzf.vim' " Integration for FZF in Vim
Plug 'scrooloose/nerdtree' " File tree explorer
Plug 'tpope/vim-vinegar' " Enhances netrw file browsing
Plug 'majutsushi/tagbar' " Code structure navigation

" UI Enhancements
Plug 'vim-airline/vim-airline' " Status line
Plug 'vim-airline/vim-airline-themes' " Themes for airline
Plug 'mhinz/vim-startify' " Start screen with session management
Plug 'mhinz/vim-signify' " Git diff indicators in the sign column

" Productivity and editing
Plug 'tpope/vim-commentary' " Easy commenting
Plug 'tpope/vim-sleuth' " Auto-detect tab settings
Plug 'tpope/vim-eunuch' " File manipulation commands
Plug 'tpope/vim-fugitive' " Git integration
Plug 'tpope/vim-repeat' " Enhances the repeat command (.)
Plug 'tpope/vim-rhubarb' " GitHub integration for Fugitive
Plug 'tpope/vim-surround' " Manipulate surrounding characters easily
Plug 'tpope/vim-unimpaired' " Useful bracket mappings
Plug 'hecal3/vim-leader-guide' " Displays mappings under <Leader>
Plug 'benmills/vimux' " Tmux integration
Plug 'janko/vim-test' " Run tests easily
Plug 'SirVer/ultisnips' " Snippet engine
Plug 'bronson/vim-trailing-whitespace' " Highlights trailing whitespace
Plug 'zhimsel/vim-stay' " Saves folds, cursor position, etc.
Plug 'liuchengxu/vista.vim' " LSP and ctags viewer
Plug 'mg979/vim-visual-multi' " Multi-cursor support
Plug 'mhinz/vim-grepper' " Quick project search
Plug 'arzg/vim-corvine' " Color scheme
Plug 'scwood/vim-hybrid' " Another color scheme

" Code linting and auto-completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Async completion framework
Plug 'dense-analysis/ale' " Linter and fixer
Plug 'ruanyl/vim-gh-line' " Copy GitHub links for code lines
Plug 'sebdah/vim-delve' " Debugging for Go
Plug 'christoomey/vim-tmux-navigator' " Navigate seamlessly between Tmux panes and Vim splits

call plug#end()

" === Appearance Settings ===
set termguicolors " Enable true colors
set background=dark " Dark mode
colorscheme hybrid " Set color scheme
let g:airline_theme='hybrid' " Match statusline with theme

" === Golang Configuration ===
let g:go_fmt_autosave = 0 " Disable auto-formatting on save
let g:go_info_mode='gopls' " Use gopls for info
let g:go_doc_popup_window = 1 " Display docs in popup
let g:go_bin_path = $HOME . '/.local/share/nvim/go/bin'
let g:go_rename_command = "gopls" " Use gopls for renaming
let $PATH = $PATH . ':' . g:go_bin_path

" === Autocomplete and Snippets ===
let g:deoplete#enable_at_startup = 1 " Enable deoplete auto-completion
let g:UltiSnipsExpandTrigger='<c-j>' " Trigger snippets
let g:UltiSnipsJumpForwardTrigger='<c-f>' " Jump forward in snippets
let g:UltiSnipsJumpBackwardTrigger='<c-b>' " Jump backward in snippets

" === Search and Navigation ===
nnoremap <silent> <c-p> :FZFFiles<cr> " Find files using FZF
nnoremap <silent> <leader>ss :Grepper -tool rg<cr> " Search with ripgrep
nnoremap <silent> <leader>sw :execute 'Rg' expand('<cword>')<CR> " Search for word under cursor

" === Window and Buffer Navigation ===
nnoremap <silent> \ :NERDTreeToggle<cr> " Toggle file explorer
nnoremap <silent> \\| :NERDTreeFind<cr> " Find current file in NERDTree
nnoremap <silent> ,b :FZFBuffers<cr> " List open buffers
nnoremap ,, <c-^> " Toggle to previous file

" === Code Editing ===
nnoremap gy :GoDefType<cr> " Jump to Go type definition
nnoremap gi :GoImplements<cr> " Find Go implementations
nnoremap gr :GoReferrers<cr> " Find Go references
nmap ,. gc$ " Toggle comment on line
vmap ,. gc " Toggle comment on selection

" === Spelling and Autocmds ===
augroup config#spell
  autocmd!
  autocmd FileType markdown,gitcommit setlocal spell spelllang=en_gb
augroup END

" === Leader Key Configuration ===
let g:mapleader=' ' " Set <Space> as the leader key
nnoremap <silent> <leader>tt :TestNearest<cr> " Run nearest test
nnoremap <silent> <leader>tf :TestFile<cr> " Run all tests in the file
nnoremap <silent> <leader>ts :TestSuite<cr> " Run test suite
nnoremap <silent> <leader>tg :TestVisit<cr> " Visit last test

