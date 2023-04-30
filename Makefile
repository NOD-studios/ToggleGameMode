.PHONY: all clean

APP_NAME = ToggleGameMode
APP_BUNDLE = $(APP_NAME).app

all: $(APP_BUNDLE)

$(APP_BUNDLE): create_toggle_game_mode_app.sh
	@chmod +x create_toggle_game_mode_app.sh
	@./create_toggle_game_mode_app.sh

clean:
	@rm -rf $(APP_BUNDLE)

.PHONY: debug

debug:
	@bash -x ToggleGameMode.app/Contents/MacOS/ToggleGameMode
