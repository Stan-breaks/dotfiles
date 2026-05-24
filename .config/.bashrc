#
# ~/.bashrc
#
# If not running interactively, don't do anything
#

if [[ -z $DISPLAY ]] && [[ $(tty) == /dev/tty1 ]]; then
    exec mango
fi

[[ $- == *i* ]] && source /usr/share/blesh/ble.sh --noattach

if [[ $- == *i* ]]; then # in interactive session
  set -o vi
fi

alias grep='grep --color=auto'
eval "$(starship init bash)"
eval "$(zoxide init bash)"
source <(carapace _carapace)

vim() {
  if [[ $# -eq 1 && -d "$1" ]]; then
    nvim -c "Oil --float $1"
  elif [[ $# -eq 0 ]]; then
    nvim
  else
    nvim "$@"
  fi
}

export SUDO_PROMPT="   ,___,
   [O.o]   \"WHO goes there?\"
   /)__)    \"WHO wants sudo?\"
-\"-\"-\"--   \"...I'm watching you...\"

[sudo] password for %p: "


export ANDROID_SDK_ROOT="$HOME/.android/sdk"
export ANDROID_HOME="$HOME/.android/sdk"
export ANDROID_AVD_HOME="$HOME/.android/avd"

export PATH="$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$PATH"

export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export PATH="$JAVA_HOME/bin:$PATH"
export PATH="$PATH:$HOME/.local/share/bin"

[[ ${BLE_VERSION-} ]] && ble-attach
eval "$(atuin init bash)"
export PATH="$HOME/.local/bin:$PATH"
ble-bind -m 'vi_imap' -f C-m accept-line
