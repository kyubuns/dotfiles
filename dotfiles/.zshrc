
# Lines configured by zsh-newuser-install
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

# 補完機能の有効化
autoload -U compinit
compinit

# プロンプトのカラー化
autoload -U colors
colors

# 変数定義をすると同時にexportされ環境変数としても設定する
setopt all_export

# ディレクトリ名のみで移動
setopt auto_cd
# cd時にディレクトリスタックにpushdする
setopt auto_pushd
# ディレクトリスタックの重複不可
setopt pushd_ignore_dups
# 引数なしのpushdをpushd $HOMEへ
setopt pushd_to_home
# 絶対パスが入った変数をディレクトリとして扱う
setopt cdable_vars

# -------------------- 補完関連の設定 --------------------
# 補完候補が複数あるときに自動的にメニューをリストアップ
setopt auto_list
# 連続する補完要求があると自動的にメニューをリストアップ
setopt auto_menu
# 絶対パスが入った変数をディレクトリとして扱う
setopt auto_name_dirs
# パスが入った変数を補完した時に末尾に/を足す
setopt auto_param_slash
# 上記の設定で足された/の後にスペースを入力すると自動で削除
setopt auto_remove_slash
# 補完候補の余白の自動圧縮表示
setopt list_packed
# 補完の表示順序を水平方向に
setopt list_rows_first
# 補完候補にファイル情報を表示
setopt list_types
# 補完候補表示時に最初の候補をカーソル位置に挿入
#setopt menu_complete

# -------------------- ファイルグロブの設定 --------------------
# ファイルグロブの有効化
setopt glob
# 拡張グロブの有効化 []の外でも^の使用可など
setopt extended_glob
# ファイルグロブで大文字小文字を区別しない
unsetopt case_glob
# =コマンドをコマンドの絶対パスに変換
setopt equals
# ファイル候補のソートで数値を正しく認識
setopt numeric_glob_sort
# lsコマンドなどでパターンマッチを複数指定した場合に
# 途中でエラーがあっても結果も表示する
setopt nomatch

# -------------------- ヒストリの設定 --------------------
# セッションが終了した順にヒストリに追記
setopt append_history
# !によるヒストリ展開の有効化
setopt bang_hist
# 実行時間をヒストリに記録
# setopt extended_history
# ヒストリ関係のビープ音をオフ
unsetopt hist_beep
# 古いヒストリの削除時に重複コマンドを優先
setopt hist_expire_dups_first
# ヒストリ内の重複したコマンドがあれば古いのを削除
# setopt hist_ignore_all_dups
# 同じコマンドの連続は記録しない
setopt hist_ignore_dups
# 先頭にスペースがあるコマンドは記録しない
setopt hist_ignore_space
# ヒストリに関数定義は記録しない
setopt hist_no_functions
# historyコマンドは記録しない
setopt hist_no_store
# 余分なスペースを削除して記録
setopt hist_reduce_blanks
# ヒストリファイル保存時に古いコマンドと同じなら無視する
setopt hist_save_no_dups
# 複数セッション起動時にコマンド実行してすぐにヒストリファイルを保存する
#setopt inc_append_history
# ヒストリの共有
#setopt share_history

# -------------------- 入出力の設定 --------------------
# エイリアスの有効化
setopt aliases
# コマンド名のスペル訂正
setopt nocorrect
# 引数のスペル訂正
# setopt correct_all
# スペル訂正時にDVORAK配列を前提に
setopt dvorak
# Ctrl+S,Ctrl+Qの無効化
unsetopt flow_control
# Ctrl+Dによるログアウトの抑制
setopt ignore_eof
# 対話的シェルでコメントの有効化
setopt interactive_comments
# コマンドとパスの対応にハッシュテーブルを利用
setopt hash_cmds
# コマンド名のハッシュ時にディレクトリもハッシュ化
setopt hash_dirs
# コマンドに/が含まれていても通常のパス検索を行う
setopt path_dirs
# rmコマンドで*指定時の確認をオフ
# setopt rm_star_silent
# rmコマンドで*指定時に一定時間waitする
# setopt rm_star_wait
# 制御構文で短縮形の有効化
setopt short_loops

# -------------------- ジョブ制御の設定 --------------------
# ジョブの頭文字だけでジョブの再実行を行う
# setopt auto_resume
# バックグラウンドジョブを低優先度で実行
setopt bg_nice
# zsh終了時にバックグラウンドジョブや一時停止ジョブを表示
# setopt check_jobs
# zsh終了時に起動しているジョブにHUPシグナルの送信
# setopt hup
# ジョブリストにロングフォーマットの使用
# setopt long_list_jobs
# ジョブ制御を可能にする
setopt monitor
# バックグラウンドジョブの状態を即時表示
setopt notify



set cdable_vars
# End of lines added by compinstall

# autoloadされる関数を検索するパスの追加
fpath=($fpath ~/.zfunc)

# 重複した設定の自動削除
typeset -U path cdpath fpath manpath

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
  PROMPT="[%m]%{%(?.$fg[cyan].$fg[red])%} %* %{${fg[green]}%}%~ %{$reset_color%}%b"
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{green}%1v%f|)"

# history関連の設定
HISTFILE=~/.zhistory
SAVEHIST=1000
SAVEHIST=10000
DIRSTACKSIZE=20

# 色付けの為の設定
alias grep='grep -n --color=auto'
alias fgrep='fgrep -n --color=auto'
alias egrep='egrep -n --color=auto'

# mercurialの設定
export HGENCODING=utf8

# 端末を256色に
export TERM=xterm-256color
export PATH=$PATH:$HOME/opt/bin
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.go/bin:$PATH

# -------------------------------------------------------------------------------
# Python
# -------------------------------------------------------------------------------

# virtualenvwrapperをインポート
if [ -f /usr/bin/virtualenvwrapper.sh ]; then
  source /usr/bin/virtualenvwrapper.sh
fi
export WORKON_HOME=$HOME/.virtualenvs

#source ~/.zsh/plugin/incr*.zsh

alias clang++="clang++ -std=c++0x -stdlib=libc++"
alias objdump="gobjdump"
alias dzshrc="cp ~/.zshrc ~/Dropbox/Public/zshrc"
alias dvimrc="cp ~/.vimrc ~/Dropbox/Public/vimrc"
alias updatezshrc="source ~/.zshrc"
alias ll="ls -l"
alias find="find -L"
alias igt="git"
alias it="git"
alias qgit="git"
alias gitn="git"
alias mv="mv -i"
alias rm="rmtrash"
alias calc="bc --mathlib --quiet"

#if [ -d "$HOME/.zsh" ]; then
#  if [ -d "$HOME/.zsh/git/auto-fu.zsh" ]; then
#    source "$HOME/.zsh/git/auto-fu.zsh/auto-fu.zsh"
#    function zle-line-init () { auto-fu-init }
#    zle -N zle-line-init
#    zstyle ':completion:*' completer _oldlist _complete
#  fi
#fi


export PATH=$HOME/.rbenv/bin:$PATH
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH
PATH=$PATH:$HOME/Tmp/rvm/bin # Add RVM to PATH for scripting
#eval "$(hub alias -s)"
eval $(/usr/libexec/path_helper -s)
eval "$(rbenv init - zsh)"

fpath=(/usr/local/share/zsh-completions/src $fpath)

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export CERTIFICATE_PATH=$HOME/Certificates/OinkCertificates.p12
export CERTIFICATE_PASSWORD=i4DvNskmdB29J722RntemyNrpGhAIbh
export WILDCARD_MOBILEPROVISION_PATH=$HOME/Certificates/OinkWildcard.mobileprovision
export HOCKEY_API_TOKEN=a77a92d8897c457285fea735e825440d
export GOPATH=$HOME/.go
