#!/bin/bash

if [ ! -f "pythia8245.tgz" ]; then
    wget http://home.thep.lu.se/~torbjorn/pythia8/pythia8245.tgz
fi

if [ -d "pythia8245" ]; then
    rm -rf pythia8245/
fi

# ./configure --prefix=$PWD/../../build/pythia8 --with-lhapdf6=$LHAPDF6_DIR --with-hepmc2=$HEPMC2_DIR
# make -j4
# make install