#!/bin/bash

HEPMC2_DIR=/mnt/d/linux/usr

PYTHIA8_DIR=$PWD/3rdparty/pythia8245/

g++ ./LHEPythia.cpp -I $PWD/include/ -I $PYTHIA8_DIR/include/ \
    -L $PYTHIA8_DIR/lib/ -lpythia8 -ldl \
    -I $HEPMC2_DIR/include -L $HEPMC2_DIR/lib -lHepMC \
    -o lhepythia