# Building spritesheets
Slack sources their emoji spritesheet from [emoji-data](https://github.com/iamcal/emoji-data), so we'll do the same. At Slack, however, they removed the 1px padding around each emoji, so we have to generate custom quantized/indexed spritesheets that are also seamless.

*Note: the building process is now split up in two scripts, deps.sh and build_sheets.sh. The old process is detailed in old_readme.md*

### First time install:
Run deps.sh to install all required dependencies for quantizing, indexing and compressing the sheets.

``` 
cd img
chmod +x deps.sh
./deps.sh
```

### Building the sheets
Simply run build_sheets.sh, the new spritesheets will be output to /img

```
# Assuming cwd is /img
chmod +x build_sheets.sh
./build_sheets.sh
```