export PATH="$PATH:$HOME/bin/:$HOME/.cargo/bin/:$HOME/.local/bin/:$HOME/.yarn/bin/"
export GPG_TTY=$(tty)

if [[ -d /opt/homebrew/ ]]; then
    eval $(/opt/homebrew/bin/brew shellenv)
fi

export LS_COLORS="no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=01;05;37;41:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.svgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.bz2=01;31:*.tbz2=01;31:*.bz=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.svg=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:"

export DO_NOT_TRACK=1
export DOTNET_CLI_TELEMETRY_OPTOUT=1

if [[ -d "$HOME/.dotnet" ]]; then
    export DOTNET_ROOT="$HOME/.dotnet"
    export PATH="$PATH:$HOME/.dotnet:$HOME/.dotnet/tools"
fi

if [[ -d "$HOME/.local/bin/zig" ]]; then
    export PATH="$PATH:$HOME/.local/bin/zig"
fi

export EDITOR="nvim"
export BROWSER="firefox"
export TERMINAL="ghostty"

export ASAN_SYMBOLIZER_PATH="/usr/bin/llvm-symbolizer"
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig/:/usr/local/lib64/pkgconfig"

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;38;5;74m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[38;5;246m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[04;38;5;146m'

export ANDROID_HOME="$HOME/.local/share/android/sdk"
export ANDROID_SDK_ROOT=$ANDROID_HOME

export GOPROXY="direct"
export GO11MODULE="auto"

if type go &> /dev/null; then
    export GOPATH="$HOME/.local/share/go"
    export GOMODCACHE="$HOME/.cache/go/mod"
    export PATH="$PATH:$GOPATH/bin"
fi

export XDG_DATA_DIRS="/usr/share/:/usr/local/share/:$HOME/.local/share/flatpak/exports/share/:/var/lib/flatpak/exports/share"

export FZF_DEFAULT_OPTS="--layout reverse --preview-window :hidden"
if type fd &> /dev/null; then
    export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'
fi

if [[ -f ~/.config/secrets ]]; then
    . ~/.config/secrets
fi
