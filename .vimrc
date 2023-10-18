syntax on

set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set smartindent

set relativenumber number
set mouse=a
set backspace=indent,eol,start
set foldmethod=syntax

set ignorecase
set incsearch
set noswapfile
set wrap
set nocompatible
set ruler

set langmap=ФфшуциловрдгчщЩ;AaiewbkjdhluxoO

" -------COC.vim------------
" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
set updatetime=300
set completeopt-=preview


if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" completer
" CocInstall coc-json coc-eslint coc-tsserver
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" syntax checks and linting
" Removed, coc-vim is enough
Plug 'dense-analysis/ale'

" Vastly improved Javascript indentation and syntax support in Vim
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx' " for jsx html

Plug 'scrooloose/nerdtree'

Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'jistr/vim-nerdtree-tabs'

Plug 'airblade/vim-gitgutter'

Plug 'jiangmiao/auto-pairs'

Plug 'pearofducks/ansible-vim'

Plug 'dracula/vim', { 'name': 'dracula' }

Plug 'easymotion/vim-easymotion'

" Fuzzy search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"apt-get install silversearcher-ag

Plug 'jparise/vim-graphql'

Plug 'KabbAmine/vCoolor.vim'

call plug#end()

" vim-jsx
let g:jsx_ext_required = 0


" ------------ COC VIM -------------------------
"
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" ------------ COC VIM -------------------------
"
let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-eslint', 'coc-css']

let g:_linters = {'javascript': ['eslint']}
let g:_completion_enabled = 0
let g:_lint_on_text_changed = 'normal'
let g:_lint_on_insert_leave = 1
let g:_disable_lsp = 1

let g:javascript_plugin_jsdoc = 0

" --------------dense/ale ------------
let g:ale_disable_lsp = 1



" ----- NERD TREE CONFIGS ----------
let NERDTreeShowLineNumbers=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 40
let g:nerdtree_tabs_focus_on_files = 1
let NERDTreeMapJumpFirstChild='\K'
let NERDTreeMapJumpLastChild='\J'
let NERDTreeAutoDeleteBuffer = 1


let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('sql', 'Green', 'none', 'red', '#07850A')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('jsx', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('ts', 'Red', 'none', '#ffa500', '#151515')

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd BufWinEnter * NERDTreeMirror

nmap <f5> :NERDTreeToggle<CR>

nmap <S-J> :tabprevious<CR>
nmap <S-K> :tabnext<CR>

noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

noremap <f9> :w<CR>
noremap <f10> :q<CR>

:inoremap <silent> <Esc> <Esc>`^

if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
    au InsertEnter,InsertChange *
        \ if v:insertmode == 'i' | 
        \   silent execute '!echo -ne "\e[6 q"' | redraw! |
        \ elseif v:insertmode == 'r' |
        \   silent execute '!echo -ne "\e[4 q"' | redraw! |
        \ endif
      au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
    endif

" highlight current file in nerdtree
" Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

au BufRead * normal zR

" ------------ NERD TREE END -----------

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

" Customize fzf colors to match your color scheme.
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-y': {lines -> setreg('*', join(lines, "\n"))}}

" Launch fzf with CTRL+P.
nnoremap <silent> <C-p> :FZF -m<CR>

" Map a few common things to do with FZF.
nnoremap <silent> <Leader><Enter> :Buffers<CR>
nnoremap <silent> <Leader>l :Lines<CR>

" Map for git blame
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

" Allow passing optional flags into the Rg command.
"   Example: :Rg myterm -g '*.md'
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \ "rg --column --line-number --no-heading --color=always --smart-case " .
  \ <q-args>, 1, fzf#vim#with_preview(), <bang>0)


colorscheme dracula
