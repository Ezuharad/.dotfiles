#!/usr/bin/env zsh

export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-/run/user/$(id -u)}
export WAYLAND_DISPLAY=${WAYLAND_DISPLAY:-wayland-0}
export DBUS_SESSION_BUS_ADDRESS=${DBUS_SESSION_BUS_ADDRESS:-"unix:path=${XDG_RUNTIME_DIR}/bus"}

DISALLOWED_PROCESSES=(
  _none
  cockatrice
  citra-qt
  dolphin-emu
  lutris
  melonDS
  mgba-qt
  modrinth-app
  mupen64plus-qt
  pcsx2
  steamwebhelper
  sudachi
  ruffle
)

pattern=""
for process in "${DISALLOWED_PROCESSES[@]}"; do
    if [[ -n $pattern ]]; then
        pattern+="\|"
    fi
    pattern+="[${process:0:1}]${process:1}"
done

if ps aux | grep -q "$pattern"; then
    MESSAGES=(
      "[MED 2.4] Remember how long thou hast been putting off these things and how often thou hast received an opportunity from the gods, and yet dost not use it."
      "[MED 2.11] Since it is possible thou mayest depart from life at this very moment, regulate every act and thought accordingly."
      "[MED 2.14] Still remember that no man loses any other life than this which he now lives, nor lives any other than this which he now loses."
      "[MED 3.7] Never value anything as profitable to thyself which shall compel thee to break thy promise, to lose thy self-respect." 
      "[MED 3.14] Hasten then to the end which thou hast before thee, and, throwing away idle hopes, come to thy own aid, if thou carest at all for thyself, while it is in thy power."
      "[P3P] To live is to lose whatever has not been chosen. To gain by loss. To choose something new. Life is precisely \"the finite\"."
      );
    selected_message=${MESSAGES[ $RANDOM % ${#MESSAGES[@]} + 1]};
    notify-send --urgency=critical --app-name "Process Monitor" --icon=image-red-eye-symbolic "Time to Work" "$selected_message";
    canberra-gtk-play --id="dialog-warning" 2>/dev/null || \
    paplay /usr/share/sounds/freedesktop/stereo/dialog-warning.oga 2>/dev/null || \
    paplay /usr/share/sounds/freedesktop/stereo/bell.oga 2>/dev/null
fi

