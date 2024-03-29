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
Plug 'junegunn/fzf.vim'
" Initialize plugin system
Plug 'tpope/vim-dadbod'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-airline/vim-airline'
Plug 'troydm/zoomwintab.vim'  
Plug 'haya14busa/incsearch.vim'
"Plug 'Valloric/MatchTagAlways'
Plug 'scrooloose/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tomasiser/vim-code-dark'
call plug#end()

set title
set nocompatible
set number
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
"Theme
set background=dark
syntax enable
" This is only necessary if you use "set termguicolors".
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" fixes glitch? in colors when using vim with tmux
set background=dark
set t_Co=256
"set termguicolors
" for vim 8
 if (has("termguicolors"))
   set termguicolors     " enable true colors support
 endif
"colorscheme codecolorscheme onedarkdark
colorscheme codedark
"navigation
"============transparency=========================
hi Normal ctermbg=NONE guibg=NONE
hi NonText ctermbg=NONE guibg=NONE
hi EndOfBuffer ctermfg=NONE guibg=NONE
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

vnoremap <c-c> "+y<CR>
nnoremap <c-v> "+p<CR>
vnoremap <c-v> "+p<CR>
inoremap <c-v> <Esc>"+p<CR>
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
nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <F4> :NERDTreeFind<CR>
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
set completeopt+=menuone
set completeopt+=noselect
"
let g:mucomplete#enable_auto_at_startup = 1
let g:airline#extensions#tabline#enabled = 1  " Mostrar buffers abiertos (como pestañas)
let g:airline#extensions#tabline#fnamemod = ':t' 
let g:airline#extensions#tabline#show_buffers = 1 " Mostrar sólo el nombre del archivo
let g:airline#extensions#tabline#keymap_ignored_filetypes = ['vimfiler', 'nerdtree']

  "let g:airline#extensions#tabline#buffer_idx_mode = 1
  "nmap <leader>1 <Plug>AirlineSelectTab1
  "nmap <leader>2 <Plug>AirlineSelectTab2
  "nmap <leader>3 <Plug>AirlineSelectTab3
  "nmap <leader>4 <Plug>AirlineSelectTab4
  "nmap <leader>5 <Plug>AirlineSelectTab5
  "nmap <leader>6 <Plug>AirlineSelectTab6
  "nmap <leader>7 <Plug>AirlineSelectTab7
  "nmap <leader>8 <Plug>AirlineSelectTab8
  "nmap <leader>9 <Plug>AirlineSelectTab9
  nmap <leader>- <Plug>AirlineSelectPrevTab
  nmap <leader>+ <Plug>AirlineSelectNextTab

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
"let g:airline_powerline_fonts = 1
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
hi CursorLine guifg=NONE guibg=#2d3c45 ctermbg=237 gui=NONE term=NONE cterm=NONE
"" operator mapping
func! DBExe(...)
	if !a:0
		let &operatorfunc = matchstr(expand('<sfile>'), '[^. ]*$')
		return 'g@'
	endif
	let sel_save = &selection
	let &selection = "inclusive"
	let reg_save = @@

	if a:1 == 'char'	" Invoked from Visual mode, use gv command.
		silent exe 'normal! gvy'
	elseif a:1 == 'line'
		silent exe "normal! '[V']y"
	else
		silent exe 'normal! `[v`]y'
	endif

	execute "DB " . @@

	let &selection = sel_save
	let @@ = reg_save
endfunc

xnoremap <expr> <Plug>(DBExe)     DBExe()
nnoremap <expr> <Plug>(DBExe)     DBExe()
nnoremap <expr> <Plug>(DBExeLine) DBExe() . '_'

xmap <leader>ps  <Plug>(DBExe)
nmap <leader>ps  <Plug>(DBExe)
vmap <leader>ps <Plug>(DBExe)
nmap <leader>pl <Plug>(DBExeLine)
vmap <leader>cf  :%!sqlformat --reindent --keywords upper --identifiers lower -<CR>
autocmd FileType sql call SqlFormatter()
function SqlFormatter()
    set noai
    " set mappings...
    vmap <leader>cf  :%!sqlformat --reindent --keywords upper --identifiers lower -<CR>
endfunction
