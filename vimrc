"set term=builtin_Linux
"set ttytype=builtin_Linux

"---------------
"基本的な設定
"---------------
"viとの互換性を取らない(vimの独自拡張機能を使うため)
set nocompatible
"改行コードの自動認識
set fileformats=unix,dos,mac
" バックスペースキーで削除できるものを追加(indent,eol,start)
"indent: 行頭の空白
"eol: 改行
"start: 挿入モード開始位置より手前の文字
set backspace=indent,eol,start
"カーソルを行頭•行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"□や○の文字があってもカーソル位置がずれないようにする
set ambiwidth=double
" ビープ音を消す
set vb t_vb=

"--------------------
" vundleの設定
"--------------------
filetype off
" vundle自身をvundleで管理
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'The-NERD-tree'

" Global Settings.
" \+r 押下で作成したファイルを実行するplugin.
Bundle 'quickrun.vim'
set splitbelow

" Snippetを利用できるplugin.
Bundle 'snipMate'
"Bundle 'neocomplcache'
"Bundle 'neocomplcache-snippets_complete'

" %キーで対応する括弧などへ移動する機能を拡張するプラグイン
" http://nanasi.jp/articles/vim/matchit_vim.html
Bundle 'matchit.zip'
:let b:match_words = "if:elseif:else:if"
:let b:match_ignorecase = 1

" ファイル検索を便利に行うことができるプラグイン.
Bundle 'vim-scripts/grep.vim'

" 対応の括弧閉じを自動的に挿入してくれるプラグイン.
Bundle 'Townk/vim-autoclose'

" Yankの履歴を管理するプラグイン.
" Bundle 'YankRing.vim'

" Redo, Undoの履歴を管理するプラグイン.
" Bundle 'sjl/gundo.vim'

" Reference
Bundle 'ref.vim'
" Bundle 'thinca/vim-ref'

" SVN Settings
" Bundle 'svndiff'

" Python Settings
Bundle 'pyflakes'
Bundle 'python.vim'

" JavaScript Settings
"Bundle 'javascript.vim'
Bundle 'jQuery'
"Bundle 'jsflakes'
"Bundle 'jslint.vim'

" PHP Settings
Bundle 'php.vim'
Bundle 'phpfolding.vim'

" Html Settings
Bundle 'emmetio/emmet'
" Bundle 'mattn/zencoding-vim'

"Bundle 'unite.vim'
"Bundle 'unite-font'
"Bundle 'unite-colorscheme'
"Bundle 'unite-locate'
"Bundle 'unite-yarm'
"Bundle 'unite-gem'
"Bundle 'MarcWeber/vim-addon-mw-utils'
"Bundle 'garbas/vim-snipmate'

filetype plugin on
filetype indent on

"---------------
"検索関連の設定
"---------------
"検索の時に大文字と小文字を区別しない
set ignorecase
"検索の時に大文字が含まれている場合は区別して検索する
set smartcase
"最後まで検索したら先頭に戻る
set wrapscan
"検索結果の文字列のハイライトを有効にする
set hlsearch
"インクリメンタルサーチを使用する
set incsearch
"インクリメンタルサーチを使用しない
"set noincsearch
" <Esc>2回でハイライトを消す
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"ビジュアルで選択検索
"vnoremap * "zy:let @/ = @z<CR>n

"--------------------------
" 表示に関する基本的な設定
"--------------------------
" カラー設定の有効
syntax on
"set t_Co=256
" ファイルの拡張子によってインデントなどをよしなにしてくれる
"filetype plugin indent on
" カラースキーマの設定(カラースキーマを~/.vim/colors/以下のディレクトリに配置)
colorscheme evening
" タブ文字をCTL-Iで表示し、行末に$で表示する。
"set list
"set listchars=eol:&,tab:>\ ,extends:<,trail:~ "行末:&, タブ: > , trail(半角スペース): ~, extendsはわからない。
" タイトルをウィンドウの枠に表示する
set title
" ウィンドウの幅より長い行は折り返して、次の行に続けて表示する
set wrap
" 行番号を表示
set number
" ルーラーの表示(※これだけはどういう効果があるかよくわからんのやが。。)
set ruler
" 括弧入力時の対応する括弧を表示
set showmatch
" 対応する括弧の表示時間を2にセット
set matchtime=2
"コメント文の色を変更
highlight Comment ctermfg=DarkCyan
" 全角文字をカラーにして表示
highlight ZenkakuSpace ctermbg=red guibg=red
match ZenkakuSpace /　\+/
" 行末のスペースを赤くハイライトさせる設定(ZenkakuSpaceのハイライトと競合する模様?)
" highlight WhitespaceEOL ctermbg=red guibg=red
" match WhitespaceEOL /\s\+$/

"-------------------------
"コマンドモードへの設定
"-------------------------
"入力中のコマンドをステータスに表示する
set showcmd
"コマンドライン補完を拡張モードにする(コマンド入力時にTabキーで補完)
set wildmenu

"-------------------------
"ステータスラインの設定
"-------------------------
"ステータスラインを常に表示
set laststatus=2
"ステータスラインに表示する情報の指定
set statusline=%n\:%y%F\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r%=<%l/%L:%p%%>
"ステータスラインの色を設定
"highlight StatusLine term=NONE cterm=NONE ctermfg=black ctermbg=white

"--------------------
"インデントの設定
"--------------------
"タブが対応する空白の数を指定
set tabstop=4
"インデントの各段階に使われる空白の数
set shiftwidth=4
"タブを挿入するとき、代わりに空白を使用する
set expandtab
"タブやバックスペースの使用時に、タブが対応する空白の数を指定
set softtabstop=4
"改行時に自動でインデント
set autoindent
"改行時にいい感じにインデントしてくれる(らしい)
set smartindent


"------------------------------
"各プログラミング言語ごとの設定
"------------------------------
filetype plugin on
" for python edit settings
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl expandtab tabstop=4 shiftwidth=4 softtabstop=4
"autocmd FileType python setl textwidth=80

" for PHP edit settings.
autocmd FileType php setl autoindent
autocmd FileType php setl expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType php setl smartindent cinwords=if,elseif,else,for,foreach,while,try,catch,class,function,switch,case

" for JavaScript edit settings.
autocmd FileType js setl autoindent
autocmd FileType js setl expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType js setl smartindent cinwords=if,elseif,else,for,foreach,while,try,catch,function,switch,case

"--------------------
"文字コードの設定
"--------------------
"set encoding=utf-8
"set termencoding=utf-8
"set fileencoding=utf-8
"set fileencodings=utf-8,euc-jp,ucs-bom,cp932,iso-2022-jp
"set fileencodings+=,ucs-2le,ucs-2

" 自動的にファイルの文字コードを認識して、編集のエンコードを設定する。
" if &encoding !=# 'utf-8'
"   set encoding=japan
"   set fileencoding=japan
" endif
" if has('iconv')
"   let s:enc_euc = 'euc-jp'
"   let s:enc_jis = 'iso-2022-jp'
"   " iconvがeucJP-msに対応しているか否かをチェック
"   if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
"     let s:enc_euc = 'eucjp-ms'
"     let s:enc_jis = 'iso-2022-jp-3'
"   " iconvがJISX0213に対応しているかどうかをチェック
"   elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
"     let s:enc_euc = 'euc-jisx0213'
"     let s:enc_jis = 'iso-2022-jp-3'
"   endif
"   " fileencodingを設定
"   if &encoding ==# 'utf-8'
"     let s:fileencodings_default = &fileencodings
"     let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
"     let &fileencodings = &fileencodings .','. s:fileencodings_default
"     unlet s:fileencodings_default
"   else
"     let &fileencodings = &fileencodings .','. s:enc_jis
"     set fileencodings+=utf-8,ucs-2le,ucs-2
"     if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
"       set fileencodings+=cp932
"       set fileencodings-=euc-jp
"       set fileencodings-=euc-jisx0213
"       set fileencodings-=eucjp-ms
"       let &encoding = s:enc_euc
"       let &fileencoding = s:enc_euc
"     else
"       let &fileencodings = &fileencodings .','. s:enc_euc
"     endif
"   endif
"   " 変数を削除
"   unlet s:enc_euc
"   unlet s:enc_jis
" endif
" if has('autocmd')
"   function! AU_ReCheck_FENC()
"     if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
"       let &fileencoding=&encoding
"     endif
"   endfunction
"   autocmd BufReadPost * call AU_ReCheck_FENC()
" endif

"--------------------
"マウスに関連する設定
"--------------------
set mouse=a
set ttymouse=xterm2

"--------------
"キーバインド
"--------------

"---------------------
"ファイル読み込み関連
"---------------------
"編集中でも他のファイルを開けるようにする
"set hidden
"他で書き換えられたら自動で読み直す
set autoread
"スワップファイル作らない
"set noswapfile

"---------------
"コピー&ペースト
"---------------
"yankしたテキストを無名レジスタだけでなく、*レジスタにも入るようにする
set clipboard+=unnamed
"CUI版vimエディタでビジュアルモードで選択したテキストをクリップボードに入れる
set clipboard+=autoselect
"GUI版vimエディタでビジュアルモードで選択したテキストをクリップボードに入れる
set guioptions+=a

"---------------
"NERDTreeの設定
"---------------
" 引数なしでvimを起動させた時はNERDTree(のみ)を開く
"autocmd vimenter * if !argc() | call s:OnlyTree() | endif
"function! s:OnlyTree()
"    NERDTree
"    wincmd l
"    q
"endfunction

"---------------
"VIMスクリプト
"---------------
"ファイルを開いたら前回のカーソル位置へ移動
augroup vimrcEx
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line('$') |
    \   exe "normal! g`\"" |
    \ endif
augroup END

" 行末スペースをファイル保存時に除去する
autocmd BufWritePre * :%s/\s\+$//ge
autocmd BufWritePre * :%s/　\+$//ge
