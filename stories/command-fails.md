# Bug - Command fails if entering a space after the command

Certain menu commands will fail when the letter is followed by a space.

It looks like this behavior happens with most commands :(

## Repro steps

1. Start the app
2. When prompted for a command type 'a '
3. Hit enter

### Expected behavior
The input will be recognized, even with extra whitespace around the command.

### Actual behaivor
The application does not prompt for a project name. Instead it just hangs and
feels broken.