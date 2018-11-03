colorscheme desert

set mouse=a
set nomousefocus
set mousehide

set encoding=utf-8

set runtimepath+=$HOME/.vim,$HOME/.vim/after
set nocompatible
set helplang& helplang=ja,en
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp932,iso2022-jp,utf-16,sjis,euc-jp
set nobomb

" 改行コードの自動認識
set fileformat=unix
set fileformats=unix,dos,mac

" スワップの設定
set swapfile

" splitの表示位置を右
set splitbelow

" vsplitの表示位置を下
set splitright

" ***** バックアップの設定 *****
" バックアップを作らない
set nobackup
" 保存時のみバックアップを作成
set writebackup
" バックアップの保存先
" バックアップファイルの拡張子
set backupext=.back
" ファイルのコピーを作成してバックアップにし上書き保存
set backupcopy=yes

" スクロールのマージ
set scrolloff=10

" ***** 検索に関する設定 *****
" 小文字での検索時に大文字小文字を区別しない
set ignorecase
" 大文字がある場合のみ大文字小文字を区別
set smartcase
" インクリメンタルサーチ
set incsearch
" 検索結果をハイライトしない
" set nohlsearch
" 検索のループ
set wrapscan

" 補完の際の大文字小文字の区別しない ignorecaseとsmartcaseに依存
set infercase

set pumheight=20

" ビープ音消去
set visualbell t_vb=

" 行番号や色分けなど
set number
set cursorline
set cursorcolumn
set guicursor& guicursor=a:blinkwait1000-blinkon750-blinkoff750

" 不可視文字の表示
" tab:最初２文字 trail:行末の空白 extends:折り返しの行末 precedes:折り返しの行頭 eol:行末
set list
set listchars=tab:\>\ ,trail:-,nbsp:%,extends:>,precedes:<

syntax on
filetype on
filetype indent on
filetype plugin on

" GUI用のオプション e削除:タブの非GUI化 m→M:メニュー非表示 r削除:サイドバー非表示
set guioptions& guioptions=ceMgr

" クリップボードの使用
set clipboard=unnamed

" :コマンドの記録数
set history=100

" キーワード補完の検索対象
"set complete=.,b,u,i

" コマンドラインの行数
set cmdheight=2

" スクリプト実行中に画面を描画しない
set lazyredraw

" ***** statuslineの設定 *****
" 常に表示
set laststatus=2
set showtabline=2
"set statusline=
set statusline=%n\:%y
set statusline+=%m%r%f
" ↓ここから右寄せ
set statusline+=%=[%{Getff()}]
set statusline+=[%{(&fenc!=''?&fenc:&enc)}]
set statusline+=[%l/%L]

function! Getff()
	if &ff == 'unix'
		return 'LF'
	elseif &ff == 'dos'
		return 'CR+LF'
	elseif &ff == 'mac'
		return 'CR'
	else
		return '?'
	endif
endfunction

" ***** タブ関係の設定 *****
" タブ幅の設定
set tabstop=2
" タブで挿入されるスペース数
set softtabstop=2
" autoindentのスペース数
set shiftwidth=2
" タブをスペースに置換
set expandtab
" 行頭でのタブをshiftwidthの幅に
set smarttab
" オートインデント
set autoindent
" オートインデントが賢くなる
set smartindent
" '>' '<' でのインデントをshiftwidthの倍数
set shiftround

" BackSpaceの設定
set backspace=indent,eol,start

" 外部でのファイル更新を自動読み込み
set autoread

" 編集中の内容を保ったまま別画面に切り替え
set hidden

" テキスト整形のオプション
set formatoptions=tcqlM1

" ファイルブラウザのディレクトリ位置
" last:前回のファイルブラウザ位置 buffer:バッファの位置 current:カレントディレクトリ
" {path}: 指定ディレクトリ
set browsedir=buffer

" ディレクトリ表示をツリー形式に
let g:netrw_liststyle=3

" コマンドライン補完の候補を表示
set wildmenu

" グローバルなマークを使用可にする
set viminfo+=f1

" ***** foldの設定 *****
" foldを有効
set foldenable
set foldminlines=2

" UTF-8で開き直すコマンド
command! -bang -nargs=? Utf8 edit<bang> ++enc=utf-8 <args>


" ：と；の置き換え
noremap ; :
noremap : ;

" .vimrcの編集・リロード
nnoremap <silent> <C-v>e :<C-u>edit ~/.vimrc<CR>
nnoremap <silent> <C-v>s :<C-u>source ~/.vimrc<CR>
nnoremap <silent> <C-m><C-m> :<C-u>nohlsearch<CR>
"nnoremap <silent> <C-u>v :<C-u>ConqueTerm zsh<CR>
nnoremap <silent> <C-t><C-t> :<C-u>setlocal wrap!<CR>
nnoremap <silent> <C-k><C-k> :<C-u>Tlist<CR>
nnoremap <silent> <C-l><C-l> :<C-u>SrcExplToggle<CR>

" マークやレジスタ
nnoremap <Space>m :<C-u>marks
nnoremap <Space>r :<C-u>registers

" 最後に変更されたテキストを選択
nnoremap gc `[v`]

" ***** タブの設定 *****
" タブのラベル表示の設定 0:なし 1:2以上で表示 2:常に表示
set showtabline=2

" ***** Unite *****
nnoremap <silent> <C-a>b :<C-u>Unite buffer<CR>
nnoremap <silent> <C-a>o :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> <C-a>f :<C-u>Unite file_mru<CR>
nnoremap <silent> <C-a>p :<C-u>VimShellPop<CR>
nnoremap <silent> <C-a>v :<C-u>AV<CR>
nnoremap <silent> <C-c>f :<C-u>cf<CR>
nnoremap <silent> <C-c>o :<C-u>copen<CR>

" ***** タブ操作の設定 *****
nnoremap [Tab] <Nop>
nmap <C-t> [Tab]
nnoremap <silent> [Tab]n :<C-u>tabnew<CR>
nnoremap <silent> [Tab]c :<C-u>tabclose<CR>
nnoremap <silent> [Tab]o :<C-u>tabonly<CR>
nnoremap [Tab]h gT
nnoremap [Tab]l gt
" <C-Tab>にもタブ切り替えを割り当て
nnoremap <C-Tab> gt
nnoremap <C-S-Tab> gT

" ***** タグジャンプ操作の設定 *****
nnoremap [Tag] <Nop>
nmap t [Tag]
nnoremap [Tag]t <C-]>
nnoremap <silent> [Tag]j :<C-u>tag<CR>
nnoremap <silent> [Tag]k :<C-u>pop<CR>
nnoremap <silent> [Tag]l :<C-u>tags<CR>

" ***** ウィンドウ操作の設定 *****
"nnoremap <S-Up> <C-w>k
"nnoremap <S-Down> <C-w>j
"nnoremap <S-Left> <C-w>h
"nnoremap <S-Right> <C-w>l

" ***** insert mode でのカーソル移動 *****
inoremap <M-k> <Up>
inoremap <M-j> <Down>
inoremap <M-h> <Left>
inoremap <M-l> <Right>

" ***** 対応括弧移動 *****
nnoremap <C-]> %

" ***** 折畳(fold)の設定 *****
" foldの先頭へ
nnoremap zh [z
" foldの末尾へ
nnoremap zl ]z

" カレントディレクトリ移動用のコマンドの定義
command! -nargs=? -complete=dir -bang CD call s:ChangeCurrentDir('<args>', '<bang>')
function! s:ChangeCurrentDir(directory, bang)
  if a:directory == ''
    |cd %:p:h
  else
    execute '|cd' . a:directory
  endif

  if a:bang ==''
    pwd
  endif
endfunction
" コマンドをマッピング
nnoremap <silent> <Space>cd :<C-u>CD<CR>

" -*-*-*-*-*- ↑ Key-mappings ↑ -*-*-*-*-*-

"set nocompatible
filetype off

if !1 | finish | endif

if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neobundle.vim.git'
NeoBundle 'Shougo/unite.vim.git'
NeoBundle 'Shougo/vimfiler.git'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'leafo/moonscript-vim'

NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

NeoBundleLazy 'nosami/Omnisharp', {
   \   'autoload': {'filetypes': ['cs']},
   \   'build': {
   \     'windows': 'MSBuild.exe server/OmniSharp.sln /p:Platform="Any CPU"',
   \     'mac': 'xbuild server/OmniSharp.sln',
   \     'unix': 'xbuild server/OmniSharp.sln',
   \   }
   \ }

call neobundle#end()

filetype plugin on
filetype indent on

set completeopt=menuone

highlight Pmenu ctermbg=31

"noremap o oX<C-h>
"nnoremap O OX<C-h>
"inoremap <CR> <CR>X<C-h>
let g:vimfiler_as_default_explorer=1
let g:vimfiler_safe_mode_by_default=0

let g:neocomplcache_snippets_dir='~/.vim/snippets'
let g:neocomplcache_snippets_disable_runtime_snippets = 0

au BufNewFile,BufRead *.as set filetype=actionscript
au BufNewFile,BufRead *.mxml set filetype=actionscript

"自動でプレビューを表示する。
let g:SrcExpl_RefreshTime   = 1
"プレビューウインドウの高さ
let g:SrcExpl_WinHeight     = 20
"tagsは自動で作成する
"let g:SrcExpl_UpdateTags    = 1
"マッピング
let g:SrcExpl_RefreshMapKey = "<Space>"
let g:SrcExpl_GoBackMapKey  = "<C-b>"

autocmd QuickfixCmdPost make,grep,grepadd,vimgrep.cf if len(getqflist()) != 0 | copen | endif

".rhtml, .rbでタブ幅を2に変更
au BufNewFile,BufRead *.rhtml set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.rb    set nowrap tabstop=2 shiftwidth=2

".c, .cpp, .hでタブ幅を4に変更
au BufNewFile,BufRead *.c    set nowrap tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.cpp  set nowrap tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.h    set nowrap tabstop=4 shiftwidth=4

hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

set background=dark

" vim立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup=1


if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.cs = '[^.]\.\%(\u\{2,}\)\?'

autocmd FileType cs setlocal omnifunc=OmniSharp#Complete


if has("gui_running")
    set guioptions=-t
endif


" OmniSharp won't work without this setting
filetype plugin on

"This is the default value, setting it isn't actually necessary
let g:OmniSharp_host = "http://localhost:2000"

"Set the type lookup function to use the preview window instead of the status line
"let g:OmniSharp_typeLookupInPreview = 1

"Timeout in seconds to wait for a response from the server
let g:OmniSharp_timeout = 1

"Showmatch significantly slows down omnicomplete
"when the first match contains parentheses.
set noshowmatch

"Super tab settings - uncomment the next 4 lines
"let g:SuperTabDefaultCompletionType = 'context'
"let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
"let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
"let g:SuperTabClosePreviewOnPopupClose = 1

"don't autoselect first item in omnicomplete, show if only one item (for preview)
"remove preview if you don't want to see any documentation whatsoever.
set completeopt=longest,menuone,preview
" Fetch full documentation during omnicomplete requests. 
" There is a performance penalty with this (especially on Mono)
" By default, only Type/Method signatures are fetched. Full documentation can still be fetched when
" you need it with the :OmniSharpDocumentation command.
" let g:omnicomplete_fetch_documentation=1

"Move the preview window (code documentation) to the bottom of the screen, so it doesn't move the code!
"You might also want to look at the echodoc plugin
set splitbelow

" Get Code Issues and syntax errors
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']

augroup omnisharp_commands
    autocmd!

    "Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
    autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

    " Synchronous build (blocks Vim)
    "autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
    " Builds can also run asynchronously with vim-dispatch installed
    autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
    " automatic syntax check on events (TextChanged requires Vim 7.4)
    "autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Automatically add new cs files to the nearest project on save
    autocmd BufWritePost *.cs call OmniSharp#AddToProject()

    "show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    "The following commands are contextual, based on the current cursor position.

    autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
    autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
    autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
    autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
    autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
    autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr> "finds members in the current buffer
    " cursor can be anywhere on the line containing an issue 
    autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>  
    autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
    autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
    autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
    autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr> "navigate up by method/property/field
    autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr> "navigate down by method/property/field

augroup END


" this setting controls how long to wait (in ms) before fetching type / symbol information.
set updatetime=500
" Remove 'Press Enter to continue' message when type information is longer than one line.
set cmdheight=2

" Contextual code actions (requires CtrlP)
nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
" Run code actions with text selected in visual mode to extract method
vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>

" rename with dialog
nnoremap <leader>nm :OmniSharpRename<cr>
nnoremap <F2> :OmniSharpRename<cr>      
" rename without dialog - with cursor on the symbol to rename... ':Rename newname'
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

" Force OmniSharp to reload the solution. Useful when switching branches etc.
nnoremap <leader>rl :OmniSharpReloadSolution<cr>
nnoremap <leader>cf :OmniSharpCodeFormat<cr>
" Load the current .cs file to the nearest project
nnoremap <leader>tp :OmniSharpAddToProject<cr>

" (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
nnoremap <leader>ss :OmniSharpStartServer<cr>
nnoremap <leader>sp :OmniSharpStopServer<cr>

" Add syntax highlighting for types and interfaces
nnoremap <leader>th :OmniSharpHighlightTypes<cr>
"Don't ask to save when changing buffers (i.e. when jumping to a type definition)
set hidden
