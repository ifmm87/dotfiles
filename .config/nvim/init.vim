"=======================PLUGINS=================================L:
let g:mapleader = " "
" Directorio de plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'Yggdroot/indentLine'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'lifepillar/vim-mucomplete' " Completion wrapper
Plug 'Shougo/echodoc.vim'
Plug 'w0rp/ale', { 'do': 'npm install -g prettier' }
Plug 'sheerun/vim-polyglot'
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
Plug 'othree/html5.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'Valloric/MatchTagAlways'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'severin-lemaignan/vim-minimap'
Plug 'tpope/vim-fugitive'
Plug 'zivyangll/git-blame.vim'
Plug 'storyn26383/vim-vue'
" Optional:
Plug 'digitaltoad/vim-pug'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
" Add maktaba and codefmt to the runtimepath.
Plug 'prettier/vim-prettier', { 'do': 'npm install -g prettier','branch': 'release/1.x', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
call plug#end()

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
set autoread
set smartindent
set background=dark  " Fondo del tema: dark/light
if (has("termguicolors"))
 set termguicolors
endif
" Theme
syntax enable
colorscheme codedark
"colorscheme dracula
autocmd Filetype javascript set softtabstop=2
autocmd Filetype javascript set sw=2
autocmd Filetype javascript set ts=2
"==================================================================

"=========================LEADER MAPPINGS==========================
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
" Reload init.vim
noremap <Leader>r :so %<CR>
nnoremap <leader>f :ZoomWinTabToggle<CR>
map <leader>t :tabnew<CR>
" highlight jumping
nnoremap <leader>% :MtaJumpToOtherTag<cr>
" Clear search highlight
nnoremap <Leader><space> :noh<CR>
" Nerdtree
nnoremap <F8> :NERDTreeToggle<CR>
nnoremap <F3> :NERDTreeFind<CR>
"para la indentacion
map <leader>i gg=G'' <CR>
" Corregir errores de ALEFix
noremap <Leader>fe :ALEFix<CR>
nmap <silent> <leader>fk :ALENext<cr>
nmap <silent> <leader>fj :ALEPrevious<cr>
nnoremap <Leader>gb :<C-u>call gitblame#echo()<CR>
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
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
"buscador
map <c-f> :Ag<CR>
"navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"=================================================================================
"=================================================================================
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_quit_key='<Esc>'
let g:multi_cursor_next_key            = '<C-m>'
let g:multi_cursor_skip_key            = '<C-M>'
"===============================LSP client====================================
" Required for operations modifying multiple buffers like rename.
" set hidden
"=====================================NERDTREE====================
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
" Invertir direccion de navegacion (de arriba a abajo)
let g:SuperTabDefaultCompletionType = '<c-n>'
"=====================================
" Activar echodoc al iniciar Neovim
let g:echodoc_enable_at_startup = 1
"========ALE======================================
noremap <F12> :ALEGoToDefinition<CR>
noremap <Leader>fe :ALEFix<CR>
noremap <Leader>fr :ALEFindReferences<CR>
" Mostrar mejor mensajes de error
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_text_changed = 0
let g:ale_linters = {'javascript': ['eslint', 'tsserver']}                                  "Lint js with eslint
let g:ale_fixers = {'javascript': ['prettier', 'eslint' ]}                       "Fix eslint errors
"/let g:ale_open_list = 1
let g:ale_javascript_prettier_options = '--print-width 180 --trailing-comma none --single-quote' " Set max width to 100 chars for prettier
let g:ale_lint_on_save = 1                                                      "Lint when saving a file
let g:ale_sign_error = '✖'                                                      "Lint error sign
let g:ale_sign_warning = '⚠'                                                    "Lint warning sign
let g:ale_statusline_format =[' %d E ', ' %d W ', '']  
let g:ale_set_highlights = 1
let g:ale_completion_enabled = 1
let g:ale_completion_max_suggestions = 500
highlight ALEError ctermbg=DarkMagenta cterm=underline
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

set statusline=%{LinterStatus()}
"=================================
" Ejecutar comandos con alt-enter :Commands
let g:fzf_commands_expect = 'alt-enter'
" Guardar historial de búsquedas
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Quitar resaltado luego de buscar
let g:incsearch#auto_nohlsearch = 1
let g:NERDSpaceDelims = 1  " Agregar un espacio después del delimitador del comentario
let g:NERDTrimTrailingWhitespace = 1  " Quitar espacios al quitar comentario
" Actualizar b7arra cada 250 mili segundos
set updatetime=250
"=======================================
let g:javascript_plugin_flow = 1
"========================================
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
"======================================================
" Autocompletado para neosnippet
let g:neosnippet#snippets_directory = ['~/.config/nvim/snippets'] 
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-space>     <Plug>(neosnippet_expand_or_jump)
smap <C-space>     <Plug>(neosnippet_expand_or_jump)
xmap <c-space>     <Plug>(neosnippet_expand_target)
" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
 let g:UltiSnipsEditSplit="vertical"
" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
"========================para volver a leer un archivo vue=======
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css 
let g:vue_disable_pre_processors=1
"========================function for fix deoplete==============
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction 
"==============trailing spaces red color=========================
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
"============transparency=========================
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE
hi! EndOfBuffer ctermfg=NONE guibg=NONE
"========================================================
autocmd FileType vue syntax sync fromstart
"===================prettier==============================
" max line length that prettier will wrap on
" " Prettier default: 80
let g:prettier#config#print_width = 180
"
" " number of spaces per indentation level
" " Prettier default: 2
let g:prettier#config#tab_width = 2
"
" " use tabs over spaces
" " Prettier default: false
let g:prettier#config#use_tabs = 'false'
"
" " print semicolons
" " Prettier default: true
let g:prettier#config#semi = 'true'
"
" " single quotes over double quotes
" " Prettier default: false
let g:prettier#config#single_quote = 'true'
"
" " print spaces between brackets
" " Prettier default: true
let g:prettier#config#bracket_spacing = 'true'
"
" " put > on the last line instead of new line
" " Prettier default: false
let g:prettier#config#jsx_bracket_same_line = 'true'
"
" " avoid|always
" " Prettier default: avoid
let g:prettier#config#arrow_parens = 'avoid'
"
" " none|es5|all
" " Prettier default: none
let g:prettier#config#trailing_comma = 'none'
"
" " flow|babylon|typescript|css|less|scss|json|graphql|markdown
" " Prettier default: babylon
let g:prettier#config#parser = 'flow'
"
" " cli-override|file-override|prefer-file
"let g:prettier#config#config_precedence = 'prefer-file'
let g:prettier#config#config_precedence = 'prefer-file'
"
" " always|never|preserve
let g:prettier#config#prose_wrap = 'preserve'
"
" " css|stri
"
" ct|ignore
let g:prettier#config#html_whitespace_sensitivity = 'css'
let g:prettier#partial_format=1
"============================================
" autocompletion
set completeopt+=preview
set completeopt+=menuone
set completeopt+=noinsert
set shortmess+=c " turn off completion messages
let g:mucomplete#enable_auto_at_startup = 1
