# Building spritesheets
Slack sources their emoji spritesheet from [emoji-data](https://github.com/iamcal/emoji-data), so we'll do the same. At Slack, however, they removed the 1px padding around each emoji, so we have to generate custom quantized/indexed spritesheets that are also seamless.

1. Install dependencies
    apt-get install php

    wget https://github.com/amadvance/advancecomp/releases/download/v1.20/advancecomp-1.20.tar.gz
    tar xzf advancecomp-1.20.tar.gz
    cd advancecomp-1.20/
    ./configure
    make
    make install
    cd ..
    rm -rf advancecomp-1.20*

    wget -Opngcrush-1.8.13.tar.gz "https://downloads.sourceforge.net/project/pmt/pngcrush/1.8.13/pngcrush-1.8.13.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fpmt%2Ffiles%2Fpngcrush%2F1.8.13%2Fpngcrush-1.8.13.tar.gz%2Fdownload&ts=1539950400"
    tar xzf pngcrush-1.8.13.tar.gz
    cd pngcrush-1.8.13/
    make
    cp pngcrush /usr/local/bin/
    rm -rf pngcrush-1.8.13*

    wget http://static.jonof.id.au/dl/kenutils/pngout-20150319-linux-static.tar.gz
    tar xzf pngout-20150319-linux-static.tar.gz
    cp pngout-20150319-linux-static/x86_64/pngout-static /usr/local/bin
    rm -rf pngout-20150319-linux-static*

    wget -Ooptipng-0.7.6.tar.gz "http://downloads.sourceforge.net/project/optipng/OptiPNG/optipng-0.7.6/optipng-0.7.6.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Foptipng%2Ffiles%2FOptiPNG%2Foptipng-0.7.6%2F&ts=1465493988&use_mirror=heanet"
    tar xzf optipng-0.7.6.tar.gz
    cd optipng-0.7.6
    ./configure
    make
    make install
    cd ..
    rm -rf optipng-0.7.6*

    apt-get install libpng-dev
    git clone git://github.com/pornel/pngquant.git
    cd pngquant/
    ./configure
    make
    make install
    cd ..
    rm -rf pngquant

    git clone https://github.com/google/zopfli.git
    cd zopfli
    make zopflipng
    cp zopflipng /usr/local/bin
    cd ..
    rm -rf zopfli

2. Clone [emoji-data](https://github.com/iamcal/emoji-data/) 
    git clone https://github.com/iamcal/emoji-data.git emoji-data
    cd emoji-data/build

3. Set build_image.php to generate seamless spritesheets
    sed -i 's/$space = 1/$space = 0/g' build_image.php

4. Build normal spritesheets and run quant_sheets on them
    php build_image.php
    chmod +x ./quant_sheets.sh
    ./quant_sheets.sh

5. Move the quantized sheets up to /img
    cd ../sheets-indexed-256
    cp -t ../ sheet_apple_64_indexed_256.png sheet_facebook_64_indexed_256.png sheet_google_64_indexed_256.png sheet_messenger_64_indexed_256.png sheet_twitter_64_indexed_256.png
