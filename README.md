# ToggleGameMode

ToggleGameMode is a macOS native application that enables or disables a "game mode" by toggling several settings:

- Dock auto-hide
- Hot Corners
- Natural Scrolling

## Requirements

- macOS

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/NOD-studios/ToggleGameMode.git
   ```

2. Change to the repository directory:

   ```bash
   cd ToggleGameMode
   ```

3. Build the application:

   ```bash
   make
   ```

4. The application `ToggleGameMode.app` will be created in the current directory. You can move it to your Applications folder or run it from the current location.

## Usage

Simply run the `ToggleGameMode.app` application to toggle between game mode and normal mode.

## Uninstallation

To uninstall the application, delete the `ToggleGameMode.app` file and remove the repository directory.

## Contributing

Feel free to submit issues, fork the repository, and create pull requests to contribute to the project.

## Debugging

To build and run the script in debug mode, use the provided Makefile:

```bash
make debug
```

This will output verbose information about the script execution, allowing you to debug any issues.

## License

[MIT License](LICENSE)
