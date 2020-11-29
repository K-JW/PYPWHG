#!/bin/bash

# 用于获取 POWHEG-BOX 以及 Dijet 过程

if [ ! -d "./POWHEG-BOX" ]; then
    svn checkout svn://powhegbox.mib.infn.it/trunk/POWHEG-BOX-NoUserProcesses POWHEG-BOX
fi

cd POWHEG-BOX

if [ ! -d "./Dijet" ]; then
    svn checkout svn://powhegbox.mib.infn.it/trunk/POWHEG-BOX/Dijet
fi

cd Dijet

## 修改 PDF 的语句如下
# sed -i "s/^PDF=.*/PDF=native/g" Makefile
# sed -i "s/^PDF=.*/PDF=lhapdf/g" Makefile

# export LHAPDF6_BIN_DIR=/mnt/d/linux/usr/bin
# export PATH=$PATH:$LHAPDF6_BIN_DIR

# make -j4