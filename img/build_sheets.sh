#!/bin/bash

git clone https://github.com/iamcal/emoji-data.git emoji-data &&
cd emoji-data/build &&
sed -i 's/$space = 1/$space = 0/g' build_image.php &&
php build_image.php &&
sudo chmod +x ./quant_sheets.sh &&
./quant_sheets.sh &&
#cd ../sheets-indexed-256 &&
#cp -t ../ sheet_apple_64_indexed_256.png sheet_facebook_64_indexed_256.png sheet_google_64_indexed_256.png sheet_messenger_64_indexed_256.png sheet_twitter_64_indexed_256.png
