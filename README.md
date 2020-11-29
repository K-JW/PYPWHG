# PYPWHG

这是一份 `Pythia8+POWHEG-BOX` 最小示例代码，主要参考了

- [`Pythia8/example/main31.cc & main41.cc`](http://home.thep.lu.se/~torbjorn/pythia82html/SampleMainPrograms.html)
- [`POWHGE-BOX`](http://powhegbox.mib.infn.it/)

## 1. 编译过程

1. 首先安装需要的一些外部库:
   - [HepMC2](http://hepmc.web.cern.ch/hepmc/)
   - [LHAPDF6](https://lhapdf.hepforge.org/) (optional)

2. 使用 `SVN` 下载 `POWHEG-BOX` 公共部分代码及感兴趣过程的代码, 示例脚本在 [`get_powheg.sh`](3rdparty/get_powheg.sh) 给出. **如果需要使用 [LHAPDF6](https://lhapdf.hepforge.org/), 则需要将 `Makefile` 中的 `PDF=native` 修改为 `PDF=lhapdf`.**

3. 编译 `Pythia8` 库. 首先需要指定配置信息, 来生成适应当前平台的 `Makefile` 文件. 具体命令如下:

    ```bash
    ./configure
    ```

    如果想编译运行 `pythia8/example` 目录下的示例代码, 最好额外指定 `HepMC2`、`LHAPDF6` 等外部库, 指定的方法可以运行 `./configure --help` 查询. 

4. 编辑 [`build.sh`](build.sh) 脚本, 指定 `HEPMC2_DIR` 的值, `HEPMC2_DIR` 指向 `HEPMC2` 安装的根目录. 然后运行 `build.sh` 脚本编译示例代码.

## 2. 使用说明

1. 首先使用 `3rdparty/POWHEG-BOX/Dijet/pwhg-main` 来生成记录事件信息的 `LHEF` 文件. 一个示例的配置文件在 `3rdparty/POWHEG-BOX/Dijet/testrun-lhc` 之中. 我们在进入上述目录后, 运行 `../pwhg-main` 即可启动生成 `pwgevents.lhe` 文件的过程.

2. 使用 `lhepythia` 程序来读入 `POWHEG-BOX` 给出的事件, 并调用 `Pythia8` 来继续演化事件. 关于 `lhepythia` 程序，可以运行 `lhepythia --help` 来获取帮助. 

---------------------------------------------------------------
