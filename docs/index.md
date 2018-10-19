# Installation
Select the Emoji style you want and copy the contents of the corresponding .js file.

![Demo](header.png)

### Mac
1. Navigate to `/Applications/Slack.app/Contents/Resources/app.asar.unpacked/src/static`
2. Paste the contents of the .js file at the end of **ssb-interop.js**. 
3. Restart Slack to see the effects (Cmd + R works just fine).


### Windows
1. Press Win + R to open the Run menu. 
2. Go to `%LOCALAPPDATA%\slack` by pasting this in the Run menu and pressing enter. 
3. (Optional) Alternatively navigate to C:\Users\USERNAME\AppData\Local\slack in Windows Explorer. 
4. Find and open the latest version directory (for example: 3.3.3) and go to `resources\app.asar.unpacked\src\static`. 
5. Paste the contents of the .js file you copied earlier at the end of **ssb-interop.js**. 
6. Restart slack to see the effects (Ctrl + R works just fine).


### Ubuntu
1. Navigate to `/snap/slack/9/usr/lib/slack/resources/app.asar.unpacked/src/static`
2. Paste the contents of the .js file you copied earlier at the end of **ssb-interop.js**. 
3. Restart slack to see the effects.


# To-do
- Automated installation
- In-app emoji style switcher
- Bring back the blobs



# My other projects
## [Cachedview](https://cachedview.nl/)
View cached/archived versions of a page easily and for multiple providers

## [Emojibuilder](https://emoji.debijl.xyz/)
Construct your own emoji/abominations!