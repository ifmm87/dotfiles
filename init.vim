"=======================PLUGINS=================================
"==================,=============================================
let g:mapleader = " "
syntax enable
" Directorio de plugins
call plug#begin('~/.local/share/nvim/plugged')

" Aquí irán los plugins a instalar
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'  " Temas para airline
Plug 'Yggdroot/indentLine'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-syntax'  " Fuente general de auto completado
Plug 'ervandew/supertab'
Plug 'Shougo/echodoc.vim'
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'ludovicchabant/vim-gutentags'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'pangloss/vim-javascript'
Plug 'troydm/zoomwintab.vim'  
Plug 'cohama/lexima.vim'                                                        " Auto cerrar (, {
Plug 'alvan/vim-closetag'                                                       " Auto cerrar html
Plug 'terryma/vim-multiple-cursors'
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'javascript.jsx'] }
Plug 'tomtom/tcomment_vim'                                                      " Comentar codigo
Plug 'inkarkat/vim-SyntaxRange'
Plug 'scrooloose/syntastic'
Plug 'othree/html5.vim'
"Plug 'lifepillar/vim-solarized8'
"Plug 'iCyMind/NeoSolarized'

call plug#end()
"=============================================================

"=================================GENERA===============$=======
set title
set number
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
"set termguicolors
set showmatch
set splitbelow
set splitright
syntax on
set noswapfile
set nobackup
set nowb
set smartindent
autocmd Filetype javascript set softtabstop=2
autocmd Filetype javascript set sw=2
autocmd Filetype javascript set ts=2
"==============LEADER==========================
nnoremap <leader>s :w<CR>
nnoremap <leader>e :e $MYVIMRC<CR>  " Abrir el archivo init.vim con <líder> + e

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
nnoremap <leader>l :bnext<CR>

" Moverse al buffer anterior con <líder> + j
nnoremap <leader>j :bprevious<CR>

" Cerrar el buffer actual con <líder> + q
nnoremap <leader>q :bdelete<CR>

"=============MAPPINGS==========================
"Especificos
"map <C-y> :w <CR> no funciona C-s problema con el mapping del SO
"para la indentacion
map <leader>i gg=G <CR>

" Maps for indentation in normal mode
nnoremap <tab> >>
nnoremap <s-tab> <<

" Indenting in visual mode
xnoremap <s-tab> <gv
xnoremap <tab> >gv

"============================PLUGIN SETTINGS==================
set background=dark  " Fondo del tema: dark/light
"colorscheme NeoSolarized
"===============================================================
let g:NERDTreeChDirMode = 2  " Cambia el directorio actual al nodo padre actual

nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>N :NERDTreeFind<CR>
let g:NERDTreeIgnore = [
			\ '\.pyc$', '^__pycache__$', '^venv$',
			\ '^tags$', 'node_modules', '\.o$'
			\]

let g:airline#extensions#tabline#enabled = 1  " Mostrar buffers abiertos (como pestañas)
let g:airline#extensions#tabline#fnamemod = ':t'  " Mostrar sólo el nombre del archivo

" Cargar fuente Powerline y símbolos (ver nota)
let g:airline_powerline_fonts = 1
set noshowmode  " No mostrar el modo actual (ya lo muestra la barra de estado)
let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']
"============================================================
" Activar deoplete al iniciar Neovim
let g:deoplete#enable_at_startup = 1

" Cerrar automaticamente la ventana de vista previa (donde se muestra documentación, si existe)
augroup deopleteCompleteDoneAu
	autocmd!
	autocmd CompleteDone * silent! pclose!
augroup END
"====================================
" Invertir direccion de navegacion (de arriba a abajo)
let g:SuperTabDefaultCompletionType = '<c-n>'
set noshowmode  " No mostrar el modo actual (echodoc hace uso de este espacio)
"=====================================
" Activar echodoc al iniciar Neovim
let g:echodoc_enable_at_startup = 1
" Mostrar mejor mensajes de error
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

"=================================

"=================================
" Nombre del archivo generado
let g:gutentags_ctags_tagfile = '.tags'
" Ejecutar comandos con alt-enter :Commands
let g:fzf_commands_expect = 'alt-enter'
" Guardar historial de búsquedas
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Empezar a buscar presionando Ctrl + p
nnoremap <C-p> :Files<CR>
" Maps requeridos
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)

" Quitar resaltado luego de buscar
let g:incsearch#auto_nohlsearch = 1
let g:NERDSpaceDelims = 1  " Agregar un espacio después del delimitador del comentario
let g:NERDTrimTrailingWhitespace = 1  " Quitar espacios al quitar comentario
" Actualizar barra cada 250 mili segundos
set updatetime=250
"=======================================
let g:javascript_plugin_flow = 1
"========================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
nnoremap <leader>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>
"=====================================================
nnoremap <leader>f :ZoomWinTabToggle<CR>
"====================================================
map <leader>t :tabnew<CR>
map <A-left> :tabp<CR>
map <A-right> :tabn<CR>
