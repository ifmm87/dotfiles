"=======================PLUGINS=================================
let g:mapleader = " "
" Directorio de plugins
call plug#begin('~/.local/share/nvim/plugged')
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
"Plug 'crusoexia/vim-monokai'
Plug 'tomasiser/vim-code-dark'
"Plug 'mhartington/oceanic-next'
Plug 'morhetz/gruvbox'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt' " Also add Glaive, which is used to configure codefmt's maktaba flags. See  `:help :Glaive` for usage.
Plug 'google/vim-glaive'
Plug 'Valloric/MatchTagAlways'
Plug 'Shougo/neosnippet'
call plug#end()
"=======================================================================

"=================================GENERAL SETTINGS======================
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
set background=dark  " Fondo del tema: dark/light
if (has("termguicolors"))
 set termguicolors
endif
" Theme
syntax enable
colorscheme codedark
autocmd Filetype javascript set softtabstop=2
autocmd Filetype javascript set sw=2
autocmd Filetype javascript set ts=2
"==================================================================

"=========================LEADER MAPPINGS==========================
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
" Guardar con leader en normal mode
nnoremap <Leader>s :w<CR>
" Open vertical split
nnoremap <Leader>& :vsp<CR>
nnoremap <Leader>" :sp<CR>
nnoremap <Leader>bb :Buffers<CR>
nnoremap <Leader>bt :BTags<CR>
nnoremap <Leader>bh :History<CR>
" Reload init.vim
noremap <Leader>r :so %<CR>
nnoremap <leader>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>
nnoremap <leader>f :ZoomWinTabToggle<CR>
map <leader>t :tabnew<CR>
" highlight jumping
nnoremap <leader>% :MtaJumpToOtherTag<cr>
" Clear search highlight
nnoremap <Leader><space> :noh<CR>
" Nerdtree
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>N :NERDTreeFind<CR>
"para la indentacion
map <leader>i gg=G <CR>
"para coregir espacios
map <leader>I :FormatCode prettier<CR>
" Generate tags
nnoremap <Leader>gt :sp term://ctags -R --exclude=node_modules .<CR>
" Mostrar los mensajes de error
nnoremap <Leader>e :lopen<CR>
nnoremap <Leader>q :lclose<CR>
" Corregir errores de ALEFix
nnoremap <Leader>he :ALEFix<CR>
"==========CONTROL===MAPPINGS====================================
" Map save to Ctrl + S
map <c-s> :w<CR>
imap <c-s> <C-o>:w<CR>
" Indenting in visual mode
xnoremap <s-tab> <gv
xnoremap <tab> >gv
" // The switch of the Source Explorer 
"nmap <F3> :SrcExplToggle<CR> 
" Maps for indentation in normal mode
nnoremap <tab> >>
nnoremap <s-tab> <<
"search file
map <c-p> :Files<CR>
" Maps requeridos
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
" Resize window with shift + and shift -
nnoremap + <c-w>5>
nnoremap - <c-w>5<
"tab navigation
map <A-left> :tabp<CR>
map <A-right> :tabn<CR>
"==================lint=========================
nnoremap <F4> :!npm run lint<CR>
nnoremap <F5> :!npm run lint -- --fix<CR>
" Move selected lines up and down
vnoremap <A-k> :m '>+1<CR>gv=gv
vnoremap <A-j>  :m '<-2<CR>gv=gv
"buscador
map <c-f> :Ag<CR>
"navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"=================================================================================
"=================================================================================
"=================================================================================
"=================================================================================
let g:NERDTreeChDirMode = 2  " Cambia el directorio actual al nodo padre actual

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
let g:ale_set_highlights = 1
":highlight ALEError ctermbg=none cterm=underline
"=================================
" Nombre del archivo generado
let g:gutentags_ctags_tagfile = '.tags'
" Ejecutar comandos con alt-enter :Commands
let g:fzf_commands_expect = 'alt-enter'
" Guardar historial de búsquedas
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Empezar a buscar presionando Ctrl + p
" Quitar resaltado luego de buscar
let g:incsearch#auto_nohlsearch = 1
let g:NERDSpaceDelims = 1  " Agregar un espacio después del delimitador del comentario
let g:NERDTrimTrailingWhitespace = 1  " Quitar espacios al quitar comentario
" Actualizar b7arra cada 250 mili segundos
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
"=============================================
let g:WebDevIcons_conceal_nerdtree_brackets = 0                                 "Eliminando el padding izquierdo
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 0
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
"===============deoplete====================
let g:deoplete#enable_at_startup = 1                                            "Enable deoplete autocompletion
let g:deoplete#file#enable_buffer_path = 1                                      "Autocomplete files relative to current buffer
let g:deoplete#tag#cache_limit_size = 10000000 

"=======================================================
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
" ================ Statusline ========================
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
"set statusline+=\ \│%0*%{ALEGetStatusLine()}%*                                  "Errors count
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
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" // Set the height of Source Explorer window 
"=============================================
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \}
"============transparency=========================
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE
hi! EndOfBuffer ctermfg=NONE guibg=NONE
