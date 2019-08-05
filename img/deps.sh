#!/bin/bash

sudo apt update -y
sudo apt upgrade -y
sudo apt install git -y
sudo apt install php -y
sudo apt install imagemagick-6.q16 -y

wget https://github.com/amadvance/advancecomp/releases/download/v1.20/advancecomp-1.20.tar.gz
tar xzf advancecomp-1.20.tar.gz
cd advancecomp-1.20/
./configure
make
sudo make install
cd ..
rm -rf advancecomp-1.20
rm advancecomp-1.20.tar.gz

wget -O pngcrush-1.8.13.tar.gz "https://downloads.sourceforge.net/project/pmt/pngcrush/1.8.13/pngcrush-1.8.13.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fpmt%2Ffiles%2Fpngcrush%2F1.8.13%2Fpngcrush-1.8.13.tar.gz%2Fdownload&ts=1539950400"
tar xzf pngcrush-1.8.13.tar.gz
cd pngcrush-1.8.13/
make
sudo cp pngcrush /usr/local/bin/
rm -rf pngcrush-1.8.13
rm pngcrush-1.8.13.tar.gz

wget http://static.jonof.id.au/dl/kenutils/pngout-20150319-linux-static.tar.gz
tar xzf pngout-20150319-linux-static.tar.gz
sudo cp pngout-20150319-linux-static/x86_64/pngout-static /usr/local/bin
rm -rf pngout-20150319-linux-static
rm pngout-20150319-linux-static.tar.gz

wget -O optipng-0.7.6.tar.gz "http://downloads.sourceforge.net/project/optipng/OptiPNG/optipng-0.7.6/optipng-0.7.6.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Foptipng%2Ffiles%2FOptiPNG%2Foptipng-0.7.6%2F&ts=1465493988&use_mirror=heanet"
tar xzf optipng-0.7.6.tar.gz
cd optipng-0.7.6
./configure
make
sudo make install
cd ..
rm -rf optipng-0.7.6
rm optipng-0.7.6.tar.gz

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
sudo cp zopflipng /usr/local/bin
cd ..
rm -rf zopfli
echo "Succesfully installed all dependencies, you can now run build-sheets.sh."
