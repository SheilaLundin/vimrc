set encoding=utf-8

call plug#begin('~/.local/share/nvim/plugged')
" Use release branch
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
" Or latest tag
" Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
" Or build from source code by use yarn: https://yarnpkg.com
" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown', {'for': '.md'}
Plug 'jiangmiao/auto-pairs'
Plug 'neomake/neomake'
Plug 'nelstrom/vim-visual-star-search'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'ashisha/image.vim'
" colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'rdavison/kimbie-vim'
Plug 'liuchengxu/space-vim-dark'
Plug 'NLKNguyen/papercolor-theme'
Plug 'joshdick/onedark.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'nightsense/carbonized'
Plug 'romainl/flattened'
Plug 'ayu-theme/ayu-vim'
Plug 'dracula/vim', {'name':'dracula'}
Plug 'morhetz/gruvbox'
call plug#end()

let mapleader = ","
" let mapleader = "\<space>"

syntax on
filetype plugin indent on

set autoindent
set smartindent
set noswapfile
set ignorecase
set smartcase
set autowrite
set autowriteall
set wildmenu
set tabstop=4
set shiftwidth=4
set cursorline
" set textwidth=80
" set colorcolumn=81

set guifont=Consolas:h10

" color gruvbox
" color kimbie
" color dracula
" color onedark
" color solarized8
" color flattened_light
" color carbonized-dark

" color space-vim-dark
" hi Comment guifg=#5C6370 ctermfg=59

" set termguicolors
" let ayucolor="light"
" color ayu

color flattened_light

set nu
set relativenumber
set foldmethod=indent
set cino=:0l1g0N-sLst0E-s
set scrolloff=7

let backupskip = "D:\backupskip"

let g:NERDTreeWinPos = "left"
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let g:ctrlp_map = '<c-p>'
" 关闭语法检查
let g:loaded_syntastic_plugin=0
let g:python3_host_prog="C:\\tools\\Anaconda3\\python.exe"

"set makeprg=ndk-build

nnoremap 0 ^

cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              nerdtree                                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree快捷键
" autocmd vimenter * NERDTree
map <leader>nn :NERDTreeToggle<cr>
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=0
" 设置宽度
let NERDTreeWinSize=31
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1
" git
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

tnoremap <Esc> <C-\><C-n>
nnoremap <F2> :r D:\workspace\frida\scripts\template.js<CR>
nnoremap <s-t> :silent !ctags<space>
"nnoremap <F5> :copen<CR>:make!<CR>
"nnoremap <s-F5> :copen<CR>:make clean<CR>
nnoremap <F5> :!ndk-build<CR>
nnoremap <s-F5> :!ndk-build clean<CR>
nnoremap <C-f> <PageDown>
nnoremap <C-b> <PageUp>

cnorem <C-v> <C-r>*
inorem <C-v> <C-r>*
vnorem <C-c> "*y
vnorem <C-x> "*d
map <silent> <leader><cr> :noh<cr>
nnorem ' `

inorem <leader>, <C-o>zz

" 删除文件结尾的空格
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

cnoremap <expr>%% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'cd '.argv()[0] | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'setlocal path+='.argv()[0] | endif
" autocmd FileType c,cpp,js,py,java setlocal textwidth=80 formatoptions+=t


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              neocomplete                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              nerdcommenter                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDSpaceDelims = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              tagbar                                   	   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd VimEnter * nested :call tagbar#autoopen(1)
nnoremap <silent> <F8> :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              undotree                                   	   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("persistent_undo")
	set undodir=$HOME."/.undodir"
	set undofile
endif


"*******************************************************************************
"" dracula
"*******************************************************************************


"*******************************************************************************
"" vscode
"*******************************************************************************
nnoremap <silent> <F9> :silent !Code "%"<CR>


"*******************************************************************************
"" coc
"*******************************************************************************
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
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

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

autocmd FileType json syntax match Comment +\/\/.\+$+
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
