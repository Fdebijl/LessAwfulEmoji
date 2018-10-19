# LessAwfulEmoji
Replace the awful Google emoji slack uses nowadays.

## Installation
Select the Emoji style you want (either Apple or Google, for the moment) and copy the contents of the corresponding .js file.

### Mac
Go to `/Applications/Slack.app/Contents/Resources/app.asar.unpacked/src/static` and paste the contents of the .js file at the end of *ssb-interop.js*. Restart Slack to see the effects.

### Windows
Go to `%LOCALAPPDATA%\slack` or alternatively navigate to C:\Users\USERNAME\AppData\Local\slack, find and open the latest version directory (for example: 3.3.3) and go to `resources\app.asar.unpacked\src\static`. Paste the contents of the .js file you copied earlier at the end of *ssb-interop.js*. Restart slack to see the effects.

## Attribution
Spritesheets are sourced from https://github.com/iamcal/emoji-data

## To-do
- Automated installation
- In-app emoji style switcher
- Additional emoji styles