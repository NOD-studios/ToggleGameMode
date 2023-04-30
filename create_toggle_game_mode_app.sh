#!/usr/bin/env bash

APP_NAME="ToggleGameMode"
EXECUTABLE="${APP_NAME}.app/Contents/MacOS/${APP_NAME}"

mkdir -p "${APP_NAME}.app/Contents/MacOS"

cat >"${EXECUTABLE}" <<'EOF'
#!/usr/bin/env bash

# Get current Hot Corners settings
topLeft=$(defaults read com.apple.dock wvous-tl-corner)
topRight=$(defaults read com.apple.dock wvous-tr-corner)
bottomLeft=$(defaults read com.apple.dock wvous-bl-corner)
bottomRight=$(defaults read com.apple.dock wvous-br-corner)

# Check if Game Mode is enabled or not
gameModeEnabled=$(defaults read com.example.GameModeToggle gameModeEnabled)

if [ "$gameModeEnabled" -eq 0 ]; then

  # Game Mode ON: Disable Dock completely
  defaults write com.apple.dock autohide -bool true
  defaults write com.apple.dock autohide-delay -float 999999
  defaults write com.apple.dock autohide-time-modifier -float 999999

  # Save the current Hot Corners settings
  defaults write com.example.GameModeToggle tl-corner -int "$topLeft"
  defaults write com.example.GameModeToggle tr-corner -int "$topRight"
  defaults write com.example.GameModeToggle bl-corner -int "$bottomLeft"
  defaults write com.example.GameModeToggle br-corner -int "$bottomRight"

  # Disable Hot Corners
  defaults write com.apple.dock wvous-tl-corner -int 1
  defaults write com.apple.dock wvous-tr-corner -int 1
  defaults write com.apple.dock wvous-bl-corner -int 1
  defaults write com.apple.dock wvous-br-corner -int 1

  # Remap F1 and F2 keys to function keys
  defaults write -g com.apple.keyboard.fnState -bool true

  # Set gameModeEnabled to 1 (Game Mode enabled)
  defaults write com.example.GameModeToggle gameModeEnabled -int 1

  defaults write com.apple.WindowManager GloballyEnabled -bool false
else
  defaults write com.apple.WindowManager GloballyEnabled -bool true

  # Game Mode OFF: Restore Dock settings
  defaults delete com.apple.dock autohide-delay
  defaults delete com.apple.dock autohide-time-modifier

  # Restore the original Hot Corners settings
  topLeft=$(defaults read com.example.GameModeToggle tl-corner)
  topRight=$(defaults read com.example.GameModeToggle tr-corner)
  bottomLeft=$(defaults read com.example.GameModeToggle bl-corner)
  bottomRight=$(defaults read com.example.GameModeToggle br-corner)

  defaults write com.apple.dock wvous-tl-corner -int "$topLeft"
  defaults write com.apple.dock wvous-tr-corner -int "$topRight"
  defaults write com.apple.dock wvous-bl-corner -int "$bottomLeft"
  defaults write com.apple.dock wvous-br-corner -int "$bottomRight"

  # Restore F1 and F2 keys to default behavior
  defaults write -g com.apple.keyboard.fnState -bool false

  # Set gameModeEnabled to 0 (Game Mode disabled)
  defaults write com.example.GameModeToggle gameModeEnabled -int 0
fi

# Restart Dock
killall Dock
