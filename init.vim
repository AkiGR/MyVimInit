" ========== plug.vimがインストールされていなければインストールする ========== "
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" ========== vim-plug ========== "
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'ryanoasis/vim-devicons'                   " アイコンを表示する
Plug 'mhinz/vim-startify'                       " スタート画面を表示
Plug 'nvim-lua/plenary.nvim'                    " 
Plug 'nvim-telescope/telescope.nvim'            " ファイル検索
Plug 'ulwlu/elly.vim'                           " 
Plug 'preservim/nerdtree'                       " ファイルディレクトリを表示
Plug 'pantharshit00/vim-prisma'                 " 
Plug 'cocopon/iceberg.vim'                      " テーマカラー
Plug 'neoclide/coc.nvim', {'branch': 'release'} " コード補完
Plug 'mattn/emmet-vim'                          " 
Plug 'vim-airline/vim-airline'                  " ステータスバーの変更
call plug#end()


" ========== startify ========== "
let g:startify_files_number = 7                      " スタート画面に表示するファイル数
let g:startify_bookmarks = ["~/.vimrc", "~/.gvimrc"] " スタート画面にブックマークするファイル
let g:startify_padding_left = 45                     " 文字を寄せる
let g:startify_session_persistence = 1               " 
let g:startify_enable_special = 0                    " 
let g:startify_change_to_vcs_root = 1                " 
let g:startify_lists = [
    \ { 'type': 'dir'       },
    \ { 'type': 'files'     },
    \ { 'type': 'sessions'  },
    \ { 'type': 'bookmarks' },
    \ { 'type': 'commands' },
    \ ]

" bookmark examples
let  g:startify_bookmarks =  [
    \ {'v': '~/.config/nvim/init.vim'},
    \ {'d': '~/.dotfiles' }
    \ ]

" custom commands
let g:startify_commands = [
    \ {'ch':  ['Health Check', ':checkhealth']},
    \ {'ps': ['Plugins status', ':PlugStatus']},
    \ {'pu': ['Update vim plugins',':PlugUpdate | PlugUpgrade']},
    \ {'uc': ['Update coc Plugins', ':CocUpdate']},
    \ {'h':  ['Help', ':help']},
    \ ]
" ASCII ARTを真ん中寄せする
" :h startifyを参照
function! s:filter_header(lines) abort
    let longest_line   = max(map(copy(a:lines), 'len(v:val)'))
    let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
    return centered_lines
endfunction

" スタート画面に表示するロゴ
let g:startify_custom_header = s:filter_header([
      \ '',
      \ '                                                                                                    ▟▙            ',
      \ '                                                                                                    ▝▘            ',
      \ '                                                            ██▃▅▇█▆▖  ▗▟████▙▖   ▄████▄   ██▄  ▄██  ██  ▗▟█▆▄▄▆█▙▖',
      \ '                                                            ██▛▔ ▝██  ██▄▄▄▄██  ██▛▔▔▜██  ▝██  ██▘  ██  ██▛▜██▛▜██',
      \ '                                                            ██    ██  ██▀▀▀▀▀▘  ██▖  ▗██   ▜█▙▟█▛   ██  ██  ██  ██',
      \ '                                                            ██    ██  ▜█▙▄▄▄▟▊  ▀██▙▟██▀   ▝████▘   ██  ██  ██  ██',
      \ '                                                            ▀▀    ▀▀   ▝▀▀▀▀▀     ▀▀▀▀       ▀▀     ▀▀  ▀▀  ▀▀  ▀▀',
      \ '',
      \ '',
      \ '',
      \ ])

" Vim color theme
"let g:elly_termmode="cterm"
"let g:airline_theme='elly'

" 文字コード
set statusline+=%{get(b:,'gitsigns_status','')}
set encoding=utf8

set fileencodings=utf-8
set fileformats=unix,dos,mac
lang en_US.UTF-8
let g:webdevicons_enable_nerdtree = 1
let g:airline_powerline_fonts = 1
set completeopt=menuone,noinsert
set guifont=DroidSansMono\ Nerd\ Font:h11

" 補完表示時のEnterで改行をしない
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"
inoremap <expr><C-n> pumvisible() ? "<Down>" : "<C-n>"
inoremap <expr><C-p> pumvisible() ? "<Up>" : "<C-p>"
set number

set expandtab
set tabstop=2
set shiftwidth=2
set nowrap
set clipboard+=unnamedplus
set modifiable
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" syntax colors 
syntax enable 
"set termguicolors
colorscheme iceberg

" Split window
" 下
nmap ss :split<Return><C-w>w
" 横
nmap sv :vsplit<Return><C-w>w

" Move window
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

" telescope
" Find files using Telescope command-line sugar.
nnoremap <C-f> <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" nerd tree
nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>

if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

"カーソルの次の文字列を取得（引数は取得したい文字数）
function! GetNextString(length) abort
	let l:str = ""
	for i in range(0, a:length-1)
		let l:str = l:str.getline(".")[col(".")-1+i]
	endfor
	return l:str
endfunction

"カーソルの前の文字列を取得（引数は取得したい文字数）
function! GetPrevString(length) abort
	let l:str = ""
	for i in range(0, a:length-1)
		let l:str = getline(".")[col(".")-2-i].l:str
	endfor
	return l:str
endfunction

"アルファベットかどうかを取得
function! IsAlphabet(char) abort
	let l:charIsAlphabet = (a:char =~ "\a")
	return (l:charIsAlphabet)
endfunction

"全角かどうかを取得
function! IsFullWidth(char) abort
	let l:charIsFullWidth = (a:char =~ "[^\x01-\x7E]")
	return (l:charIsFullWidth)
endfunction

"数字かどうかを取得
function! IsNum(char) abort
	let l:charIsNum = (a:char >= "0" && a:char <= "9")
	return (l:charIsNum)
endfunction

"括弧の中にいるかどうかを取得
function IsInsideParentheses(prevChar,nextChar) abort
	let l:cursorIsInsideParentheses1 = (a:prevChar == "{" && a:nextChar == "}")
	let l:cursorIsInsideParentheses2 = (a:prevChar == "[" && a:nextChar == "]")
	let l:cursorIsInsideParentheses3 = (a:prevChar == "(" && a:nextChar == ")")
	return (l:cursorIsInsideParentheses1 || l:cursorIsInsideParentheses2 || l:cursorIsInsideParentheses3)
endfunction

"括弧の入力
function! InputParentheses(parenthesis) abort
	let l:nextChar = GetNextString(1)
	let l:prevChar = GetPrevString(1)
	let l:parentheses = { "{": "}", "[": "]", "(": ")" }

	let l:nextCharIsEmpty = (l:nextChar == "")
	let l:nextCharIsCloseParenthesis = (l:nextChar == "}" || l:nextChar == "]" || l:nextChar == ")")
	let l:nextCharIsSpace = (l:nextChar == " ")

	if l:nextCharIsEmpty || l:nextCharIsCloseParenthesis || l:nextCharIsSpace
		return a:parenthesis.l:parentheses[a:parenthesis]."\<LEFT>"
	else
		return a:parenthesis
	endif
endfunction

"閉じ括弧の入力
function! InputCloseParenthesis(parenthesis) abort
	let l:nextChar = GetNextString(1)
	if l:nextChar == a:parenthesis
		return "\<RIGHT>"
	else
		return a:parenthesis
	endif
endfunction

"クォーテーションの入力
function! InputQuot(quot) abort
	let l:nextChar = GetNextString(1)
	let l:prevChar = GetPrevString(1)

	let l:cursorIsInsideQuotes = (l:prevChar == a:quot && l:nextChar == a:quot)
	let l:nextCharIsEmpty = (l:nextChar == "")
	let l:nextCharIsClosingParenthesis = (l:nextChar == "}" || l:nextChar == "]" || l:nextChar == ")")
	let l:nextCharIsSpace = (l:nextChar == " ")
	let l:prevCharIsAlphabet = IsAlphabet(l:prevChar)
	let l:prevCharIsFullWidth = IsFullWidth(l:prevChar)
	let l:prevCharIsNum = IsNum(l:prevChar)
	let l:prevCharIsQuot = (l:prevChar == "\'" || l:prevChar == "\"" || l:prevChar == "\`")

	if l:cursorIsInsideQuotes
		return "\<RIGHT>"
	elseif l:prevCharIsAlphabet || l:prevCharIsNum || l:prevCharIsFullWidth || l:prevCharIsQuot
		return a:quot
	elseif l:nextCharIsEmpty || l:nextCharIsClosingParenthesis || l:nextCharIsSpace
		return a:quot.a:quot."\<LEFT>"
	else
		return a:quot
	endif
endfunction

"改行の入力
function! InputCR() abort
	let l:nextChar = GetNextString(1)
	let l:prevChar = GetPrevString(1)
	let l:cursorIsInsideParentheses = IsInsideParentheses(l:prevChar,l:nextChar)

	if l:cursorIsInsideParentheses
		return "\<CR>\<ESC>\<S-o>"
	else
		return "\<CR>"
	endif
endfunction

"スペースキーの入力
function! InputSpace() abort
	let l:nextChar = GetNextString(1)
	let l:prevChar = GetPrevString(1)
	let l:cursorIsInsideParentheses = IsInsideParentheses(l:prevChar,l:nextChar)

	if l:cursorIsInsideParentheses
		return "\<Space>\<Space>\<LEFT>"
	else
		return "\<Space>"
	endif
endfunction

"バックスペースの入力
function! InputBS() abort
	let l:nextChar = GetNextString(1)
	let l:prevChar = GetPrevString(1)
	let l:nextTwoString = GetNextString(2)
	let l:prevTwoString = GetPrevString(2)

	let l:cursorIsInsideParentheses = IsInsideParentheses(l:prevChar,l:nextChar)

	let l:cursorIsInsideSpace1 = (l:prevTwoString == "{ " && l:nextTwoString == " }")
	let l:cursorIsInsideSpace2 = (l:prevTwoString == "[ " && l:nextTwoString == " ]")
	let l:cursorIsInsideSpace3 = (l:prevTwoString == "( " && l:nextTwoString == " )")
	let l:cursorIsInsideSpace = (l:cursorIsInsideSpace1 || l:cursorIsInsideSpace2 || l:cursorIsInsideSpace3)

	let l:existsQuot = (l:prevChar == "'" && l:nextChar == "'")
	let l:existsDoubleQuot = (l:prevChar == "\"" && l:nextChar == "\"")

	if l:cursorIsInsideParentheses || l:cursorIsInsideSpace || l:existsQuot || l:existsDoubleQuot
		return "\<BS>\<RIGHT>\<BS>"
	else
		return "\<BS>"
	endif
endfunction

"括弧で挟む
function! ClipInParentheses(parenthesis) abort
	let l:mode = mode()
	let l:parentheses = { "{": "}", "[": "]", "(": ")" }
	if l:mode ==# "v"
		return "\"ac".a:parenthesis."\<ESC>\"agpi".l:parentheses[a:parenthesis]
	elseif l:mode ==# "V"
		return "\"ac".l:parentheses[a:parenthesis]."\<ESC>\"aPi".a:parenthesis."\<CR>\<ESC>\<UP>=%"
	endif
endfunction

"クォーテーションで挟む
function! ClipInQuot(quot) abort
	let l:mode = mode()
	if l:mode ==# "v"
		return "\"ac".a:quot."\<ESC>\"agpi".a:quot
	endif
endfunction

inoremap <expr> { InputParentheses("{")
inoremap <expr> [ InputParentheses("[")
inoremap <expr> ( InputParentheses("(")
inoremap <expr> } InputCloseParenthesis("}")
inoremap <expr> ] InputCloseParenthesis("]")
inoremap <expr> ) InputCloseParenthesis(")")
inoremap <expr> ' InputQuot("\'")
inoremap <expr> " InputQuot("\"")
inoremap <expr> ` InputQuot("\`")
inoremap <expr> <CR> InputCR()
inoremap <expr> <Space> InputSpace()
inoremap <expr> <BS> InputBS()
xnoremap <expr> { ClipInParentheses("{")
xnoremap <expr> [ ClipInParentheses("[")
xnoremap <expr> ( ClipInParentheses("(")
xnoremap <expr> ' ClipInQuot("\'")
xnoremap <expr> " ClipInQuot("\"")
xnoremap <expr> ` ClipInQuot("\`")

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  " nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  " inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  " vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
" Run Prettier
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
