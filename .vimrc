let g:mapleader = " "
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Any valid git URL is allowed
" Multiple Plug commands can be written in a single line using | separators
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Initialize plugin system
Plug 'martingms/vipsql'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-airline/vim-airline'
Plug  'zweifisch/pipe2eval'
"Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'dunstontc/vim-vscode-theme'
"Plug 'tomasiser/vim-code-dark'
Plug 'troydm/zoomwintab.vim'  
Plug 'lifepillar/pgsql.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'lifepillar/vim-mucomplete' " Completion wrapper
Plug 'vim-scripts/dbext.vim'
call plug#end()

set title
set number
set relativenumber                                                              "Show numbers relative to current line
set history=500                                                                 "Store lots of :cmdline history
"set fileencoding=utf-8 
set mouse=a
set nowrap
set cursorline
set colorcolumn=120
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab
set hidden
set ignorecase
set smartcase
set spelllang=en,es
set showmatch
set splitbelow
set splitright
syntax on
set noswapfile
set nobackup
set nowb
set autoread
set smartindent
set noshowmode
set background=dark  " Fondo del tema: dark/light
" if (has("termguicolors"))
"  set termguicolors
" endif
syntax enable
" Theme
"colorscheme codedark
colorscheme dark_plus
"navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

vnoremap <c-c> "+y<CR>
nnoremap <c-v> "+p<CR>
nnoremap <leader>s :w<CR>
" Usar <líder> + y para copiar al portapapeles
vnoremap <leader>y "+y
nnoremap <leader>y "+y
" Usar <líder> + d para cortar al portapapeles
vnoremap <leader>d "+d
nnoremap <leader>d "+d
" Usar <íder> + p para pegar desde el portapapeles
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>P "+P
" Moverse al buffer siguiente con <líder> + l
map <leader>l :bnext<CR>
" Moverse al buffer anterior con <líder> + j
nnoremap <leader>h :bprevious<CR>
" Cerrar el buffer actual con <líder> + q
nnoremap <leader>q :bdelete<CR>
nnoremap <leader>o :new<CR>
nnoremap <leader>vo :vnew<CR>
" Guardar con leader en normal mode
nnoremap <Leader>s :w<CR>
" Open vertical split
nnoremap <Leader>& :vsp<CR>
nnoremap <Leader>" :sp<CR>
nnoremap <Leader>bb :Buffers<CR>
nnoremap <Leader>bt :BTags<CR>
nnoremap <Leader>bh :History<CR>
nnoremap <leader>f :ZoomWinTabToggle<CR>
map <leader>t :tabnew<CR>
" Clear search highlight
nnoremap <Leader><space> :noh<CR>
" Nerdtree
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :NERDTreeFind<CR>
"para la indentacion
"==========CONTROL===MAPPINGS====================================
" Map save to Ctrl + S
map <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>
" Indenting in visual mode
xnoremap <s-tab> <gv
xnoremap <tab> >gv
" // The switch of the Source Explorer 
"nmap <F3> :SrcExplToggle<CR> 
" Maps for indentation in normal mode
nnoremap <tab> >>
nnoremap <s-tab> <<
" Maps requeridos
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
" Resize window with shift + and shift -
nnoremap + <c-w>5>
nnoremap - <c-w>5<
"tab navigation
" Move selected lines up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
let g:sql_type_default = 'pgsql'
set completeopt+=menuone
set completeopt+=noselect
"let g:airline_theme = ''
"
"
let g:mucomplete#enable_auto_at_startup = 1
let g:airline#extensions#tabline#enabled = 1  " Mostrar buffers abiertos (como pestañas)
let g:airline#extensions#tabline#fnamemod = ':t'  " Mostrar sólo el nombre del archivo
" Cargar fuente Powerline y símbolos (ver nota)
let g:airline_powerline_fonts = 1
" set noshowmode  " No mostrar el modo actual (ya lo muestra la barra de estado)
"bus
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
let g:vipsql_auto_scroll_enabled = 0

" Whether or not to print a separator in the output buffer when sending a new
" command/query to psql.
let g:vipsql_separator_enabled = 1 

" What that separator should look like.
let g:vipsql_separator = '=========================================================================================================================================\n=============================================================================================================='
let g:vipsql_auto_clear_enabled = 1

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
" 
let g:multi_cursor_use_default_mapping=0

" Default mapping
 let g:multi_cursor_quit_key='<Esc>'
 let g:multi_cursor_next_key            = '<C-m>'
 let g:multi_cursor_skip_key            = '<C-M>'
let g:pipe2eval_map_key = '<Leader>mg'
"============transparency=========================
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE
hi! EndOfBuffer ctermfg=NONE guibg=NONE
