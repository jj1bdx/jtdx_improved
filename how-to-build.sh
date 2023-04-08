#!/bin/sh
mkdir build
cd build
# CMAKE_PREFIX_PATH: where you can find the latest hamlib
# CMAKE_INSTALL_PREFIX: local installation prefix
cmake -DCMAKE_PREFIX_PATH=/usr/local -DCMAKE_INSTALL_PREFIX=~/bin/jtdx -DWSJT_SKIP_MANPAGES=ON -DWSJT_GENERATE_DOCS=OFF ..
make -j12
cmake --build . --target install
