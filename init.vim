"=======================PLUGINS=================================
"==================,=============================================
let g:mapleader = " "
syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set t_Co=256
" Directorio de plugins
call plug#begin('~/.local/share/nvim/plugged')

" Aquí irán los plugins a instalar
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-syntax'  " Fuente general de auto completado
Plug 'ervandew/supertab'
Plug 'Shougo/echodoc.vim'
Plug 'w0rp/ale', { 'do': 'npm install -g prettier' }
Plug 'sheerun/vim-polyglot'
Plug 'ludovicchabant/vim-gutentags'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'pangloss/vim-javascript'
Plug 'troydm/zoomwintab.vim'  
Plug 'cohama/lexima.vim'                                                        " Auto cerrar (, {
Plug 'alvan/vim-closetag'                                                       " Auto cerrar html
Plug 'terryma/vim-multiple-cursors'
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'javascript.jsx'] }
Plug 'inkarkat/vim-SyntaxRange'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'othree/html5.vim'
Plug 'crusoexia/vim-monokai'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plug 'google/vim-glaive'
call plug#end()
"=============================================================

"=================================GENERAL===============$=======
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
map <leader>l :bnext<CR>

" Moverse al buffer anterior con <líder> + j
nnoremap <leader>h :bprevious<CR>

" Cerrar el buffer actual con <líder> + q
nnoremap <leader>q :bdelete<CR>
nnoremap <leader>o :new<CR>
nnoremap <leader>vo :vnew<CR>

"=============MAPPINGS==========================
"Especificos
"map <C-y> :w <CR> no funciona C-s problema con el mapping del SO
" Map save to Ctrl + S
map <c-s> :w<CR>
imap <c-s> <C-o>:w<CR>
nnoremap <Leader>s :w<CR>
" zoom buffer
" Open vertical split
nnoremap <Leader>% :vsp<CR>
nnoremap <Leader>" :sp<CR>

" Maps for indentation in normal mode
nnoremap <tab> >>
nnoremap <s-tab> <<

" Indenting in visual mode
xnoremap <s-tab> <gv
xnoremap <tab> >gv

"============================PLUGIN SETTINGS==================
set background=dark  " Fondo del tema: dark/light
colorscheme monokai 
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
"=====================================
" Activar echodoc al iniciar Neovim
let g:echodoc_enable_at_startup = 1
" Mostrar mejor mensajes de error
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_text_changed = 0
let g:ale_linters = {'javascript': ['eslint']}                                  "Lint js with eslint
let g:ale_fixers = {'javascript': ['prettier', 'eslint']}                       "Fix eslint errors
let g:ale_javascript_prettier_options = '--print-width 100'                     "Set max width to 100 chars for prettier
let g:ale_lint_on_save = 1                                                      "Lint when saving a file
let g:ale_sign_error = '✖'                                                      "Lint error sign
let g:ale_sign_warning = '⚠'                                                    "Lint warning sign
let g:ale_statusline_format =[' %d E ', ' %d W ', '']  
"=================================
" Nombre del archivo generado
let g:gutentags_ctags_tagfile = '.tags'
" Ejecutar comandos con alt-enter :Commands
let g:fzf_commands_expect = 'alt-enter'
" Guardar historial de búsquedas
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Empezar a buscar presionando Ctrl + p
map <c-p> :GFiles<CR>
nnoremap <Leader>bb :Buffers<CR>
nnoremap <Leader>bt :BTags<CR>
nnoremap <Leader>bh :History<CR>
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
" ================ Functions ======================== {{{
" Creando nuevo tipo de archivo para una extension vue
" autocmd BufRead,BufNewFile *.vue set filetype=vue                               " .config/nvim/syntax/vue/Syntax.Include.vim
autocmd BufRead,BufNewFile *.vue set filetype=html

function! NERDTreeHighlightFile(extension, fg)                                  " NERDTrees File highlighting color
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s.*\.\('. substitute(a:extension,'_','\\|','') .'\)$#'
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg=none ctermfg='. a:fg .' guibg=none guifg='. a:fg
endfunction
call NERDTreeHighlightFile('js_py', 'LightGreen')                               "NERDTress File highlighting
call NERDTreeHighlightFile('vue', 'LightMagenta')
call NERDTreeHighlightFile('json', 'LightYellow')
call NERDTreeHighlightFile('html_css', 'LightCyan')
call NERDTreeHighlightFile('md', 'LightCyan')
let g:NERDTreeChDirMode = 0                                                     "Always change the root directory
let g:NERDTreeMinimalUI = 1                                                     "Disable help text and bookmark title
let g:NERDTreeShowHidden = 1                                                    "Show hidden files in NERDTree

let g:WebDevIcons_conceal_nerdtree_brackets = 0                                 "Eliminando el padding izquierdo
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 0
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
"===============deoplete====================
let g:deoplete#enable_at_startup = 1                                            "Enable deoplete autocompletion
let g:deoplete#file#enable_buffer_path = 1                                      "Autocomplete files relative to current buffer
let g:deoplete#tag#cache_limit_size = 10000000 
" Resize window with shift + and shift -
nnoremap + <c-w>5>
nnoremap - <c-w>5<
"=================================
set wildmode=list:full
set wildignore=*.o,*.obj,*~                                                     "stuff to ignore when tab completing
set wildignore+=*.git*
set wildignore+=*.meteor*
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*cache*
set wildignore+=*logs*
set wildignore+=*node_modules/**
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
" ================ Statusline ======================== {{{
set statusline=\ %{toupper(mode())}                                             "Mode
set statusline+=\ \│\ %4F                                                       "File path
set statusline+=\ %1*%m%*                                                       "Modified indicator
set statusline+=\ %w                                                            "Preview indicator
set statusline+=\ %r                                                            "Read only indicator
set statusline+=\ %q                                                            "Quickfix list indicator
set statusline+=\ %=                                                            "Start right side layout
set statusline+=\ %{&enc}                                                       "Encoding
set statusline+=\ \│\ %y                                                        "Filetype
set statusline+=\ \│\ %p%%                                                      "Percentage
set statusline+=\ \│\ %l/%L                                                     "Current line number/Total line numbers
set statusline+=\ \│\ %c                                                        "Column number
set statusline+=\ \│%1*%{ALEGetStatusLine()}%*                                  "Errors count
"==================clear search highlighting==========
" Clear search highlight
nnoremap <Leader><space> :noh<CR>
"===================nerdtree==========================
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
"let g:NERDCustomDelimiters = { 'c': { 'left': '/*','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
"====================reload config==================
" Reload init.vim
noremap <Leader>r :so %<CR>
"==================lint=========================
" Buscar tareas pendientes
nnoremap <F4> :!npm run lint<CR>
nnoremap <F5> :!npm run lint -- --fix<CR>
"================================================
" Move selected lines up and down
vnoremap <A-Down> :m '>+1<CR>gv=gv
vnoremap <A-Up>  :m '<-2<CR>gv=gv
"=================buscador===============================
map <c-f> :Ag<CR>
"===============fix spacing============================
function! Fix_spacing()
    %s/\<\(if\|for\|while\|switch\)(\s*/\1 (/ge     " if (
    %s/\<\(else\){/\1 {/ge                          " else {
    %s/}\(else\)/} \1/ge                            " } else
    %s/ *){ */) {/ge                                " ) {
    %s/\((\) \(\S\)/\1\2/ge                         " no space after (
    %s/\n\n\n\+/\r\r/ge                             " single empty line
    %s/\([,;=:<>!|]\)\(\S\)/\1 \2/ge                " space after ,;
    %s/\([=<>!|]\)\(\S\)/ \1/ge            " space before ,;
    %s/\(\S\) \([,;:)]\)/\1\2/ge                     " no space before ,;)
    %s/\s*$//ge                                     " no terminal space
    %s/^\([^ ^\t].*\){/\1\r{/ge                     " { on new line for functions
    :%s/\v(\w) ?(\+|-|\*/|\>\=|\<\=|!\=|\=) ?(\w|-)/\1 \2 \3/g	

endfunction
"para la indentacion
map <leader>i gg=G <CR>
"para coregir espacios
map <leader>I :FormatCode prettier<CR>
"===============transparency============================
hi Normal guibg=NONE ctermbg=NONE
