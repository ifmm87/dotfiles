syntax on
set title
set number
set relativenumber
set mouse=a
set cursorline
set noswapfile
set smartindent
set expandtab
set splitbelow
set splitright
syntax enable
set nowrap
let g:mapleader = " "
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Initialize plugin system
Plug 'martingms/vipsql'
Plug 'vim-scripts/vimongous'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-airline/vim-airline'

call plug#end()

let g:airline#extensions#tabline#enabled = 1  " Mostrar buffers abiertos (como pestañas)

"=============for vipsql===========
" Starts an async psql job, prompting for the psql arguments.
" Also opens a scratch buffer where output from psql is directed.
noremap <leader>po :VipsqlOpenSession<CR>

" Terminates psql (happens automatically if the scratch buffer is closed).
noremap <silent> <leader>pk :VipsqlCloseSession<CR>

" In normal-mode, prompts for input to psql directly.
nnoremap <leader>ps :VipsqlShell<CR>

" In visual-mode, sends the selected text to psql.
vnoremap <leader>ps :VipsqlSendSelection<CR>

" Sends the selected _range_ to psql.
noremap <leader>pr :VipsqlSendRange<CR>

" Sends the current line to psql.
noremap <leader>pl :VipsqlSendCurrentLine<CR>

" Sends the entire current buffer to psql.
noremap <leader>pb :VipsqlSendBuffer<CR>

" Sends `SIGINT` (C-c) to the psql process.
noremap <leader>pc :VipsqlSendInterrupt<CR>

" Which command to run to get psql. Should be simply `psql` for most.
let g:vipsql_psql_cmd = "psql"

" The prompt to show when running `:VipsqlShell`
let g:vipsql_shell_prompt = "> "

" What `vim` command to use when opening the scratch buffer
let g:vipsql_new_buffer_cmd = "rightbelow split"

" Commands executed after opening the scratch buffer
" Chain multiple commands together with `|` like so:
" "setlocal buftype=nofile | setlocal nowrap"
let g:vipsql_new_buffer_config = 'setlocal buftype=nofile'

" Whether or not the vipsql-buffer should automatically scroll to the bottom
" on new input.
let g:vipsql_auto_scroll_enabled = 1

" Whether or not to print a separator in the output buffer when sending a new
" command/query to psql.
let g:vipsql_separator_enabled = 0 

" What that separator should look like.
let g:vipsql_separator = '=========================================================================================================================================\n=============================================================================================================='

nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :NERDTreeFind<CR>


" Moverse al buffer siguiente con <líder> + l
 map <leader>l :bnext<CR>
" " Moverse al buffer anterior con <líder> + j
 nnoremap <leader>h :bprevious<CR>
" " Cerrar el buffer actual con <líder> + q
 nnoremap <leader>q :bdelete<CR>
 nnoremap <leader>o :new<CR>
 nnoremap <leader>vo :vnew<CR>
 " Guardar con leader en normal mode
 nnoremap <Leader>s :w<CR>
" "
let g:multi_cursor_use_default_mapping=0

" Default mapping
 let g:multi_cursor_quit_key='<Esc>'
 let g:multi_cursor_next_key            = '<C-m>'
 let g:multi_cursor_skip_key            = '<C-M>'
"
"





