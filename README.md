# LessAwfulEmoji
Replace the awful Google emoji slack uses nowadays.

## Installation
Select the Emoji style you want (either Apple or Google, for the moment) and copy the contents of the corresponding .js file.

### Mac
1. Go to `/Applications/Slack.app/Contents/Resources/app.asar.unpacked/src/static`
2. Paste the contents of the .js file at the end of *ssb-interop.js*. 
3. Restart Slack to see the effects (Cmd + R works just fine).

### Windows
1. Press Win + R to open the Run menu. 
2a. Go to `%LOCALAPPDATA%\slack` by pasting this in the Run menu and pressing enter. 
2b. Alternatively navigate to C:\Users\USERNAME\AppData\Local\slack in Windows Explorer. 
3. Find and open the latest version directory (for example: 3.3.3) and go to `resources\app.asar.unpacked\src\static`. 
4. Paste the contents of the .js file you copied earlier at the end of *ssb-interop.js*. 
5. Restart slack to see the effects (Ctrl + R works just fine).

## Attribution
Spritesheets are sourced from https://github.com/iamcal/emoji-data

## To-do
- Automated installation
- In-app emoji style switcher
- Bring back the blobs
