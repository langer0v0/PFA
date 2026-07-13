# 计算机程序设计基础 A
## 仓库概述
《计算机程序设计基础》 是由水天学士-浪歌（Bilibili、抖音、小红书ID：水天学士）开源、水精灵浪花主讲的信息科技基础知识专栏，本文档为对应的实验内容说明。

## 实验环境
```shell
cd ~
git clone https://gitee.com/langer0v0/PFA.git # 下载代码仓库（注意：0v0 当中是两个零）
cd PFA # 进入实验目录
chmod +x setup.sh # 对初始化脚本添加可执行权限
./setup.sh # 执行实验脚本
```
注意：实验环境在 PFA 目录下进行设置，仅需设置一次即可（多次重复设置无影响）；环境配置完成后，每次执行操作应该在 PFA/LAB 目录中进行；

## 基本操作
1. 使用 OIRV 执行程序时，可以使用以下五种方式：
- 对一串代表 RISC-V 指令的 01 序列（可用'-'、'_'分隔序列）进行测试：
```shell
make asm CODE=000000000001000000000000100100110000000000010000100000010001001100000000000100010000000110010011
make asm CODE="00000000000100000000000010010011_00000000000100001000000100010011_00000000000100010000000110010011"
```
- 使用一段汇编指令（两条汇编指令需要使用'\n'分隔开）进行测试：
```shell
make asm CODE='addi ra, zero, 1\naddi sp, ra, 1\naddi gp, sp, 1'
make asm CODE="addi x11, zero, 1\naddi x12, x11, 1\naddi x11, x12, 1"
```
- 对某一个汇编文件（汇编文件位于 LAB/asm 目录）进行测试，在 LAB 目录下：
```shell
# cd LAB
make SRC=hello # 显示执行信息
make SRC=hello 1> a.log # 不显示任何其他执行信息
```
- 对一个二进制程序文件进行测试：
```shell
# cd LAB
make FILE=display_image
make FILE=coremark50
```
- 对某一个 C 语言源文件（汇编文件位于 LAB/c 目录）进行测试，在 LAB 目录下：
```shell
# cd LAB
make SRC=return # 显示执行信息
make SRC=return 1> a.log # 不显示任何其他执行信息
```
2. 使用本机执行 C 语言程序时，可以使用以下方式：
```shell
# cd LAB
make SRC=return PLATFORM=pc # 显示执行信息
make SRC=return PLATFORM=pc 1> a.log # 不显示任何其他执行信息
```
3. 数制转换：
```shell
# cd LAB
make conv VAL=0o10101
```
4. 显示 RISC-V 架构的通用寄存器与别名：
```shell
# cd LAB
make reg-map
```
5. 显示所有可以执行的汇编代码：
```shell
# cd LAB
make list
```
6. 对编译生成的可执行文件进行反汇编（FUNC 参数可指定标号，默认指定：_start）：
```shell
# cd LAB
make dump FUNC=_start SRC=hello
```
7. 读取可执行文件的符号（标号）信息：
```shell
# cd LAB
make sym SRC=hello
```
8. 将一张图片等比例缩放到指定宽度，并转换为 OIRV 可处理的 RGB24 格式（注意：长与宽都不得大于 255；指定 PIC 参数时，需要输入后缀）：
```shell
make im PIC=image0.png WIDTH=45
```
9. 使用模板 LAB/asm/start.s 初始化一个汇编文件，由 SRC 指定名称，放在 LAB/asm 目录：
```shell
make new SRC=abc
```
10. 使用模板 LAB/c/basic.c 初始化一个汇编文件，由 SRC 指定名称，放在 LAB/c 目录：
```shell
make new-c SRC=abc
```
11. 显示 C 运算符列表（结合性、优先级、功能描述）：
```shell
make ops
```

## 命令参数
1. SRC：以汇编文件或者 C 语言源文件编译并执行程序时，用于指定在 asm 目录当中要进行编译、运行的汇编文件名称（不需要带上后缀）；
2. CODE：以 01 序列形式执行程序时，用于指定序列的内容，注意：序列中间可以使用'-'或'_'分隔开，以方便阅读；而以汇编指令执行程序时，用于指定一串汇编指令，注意：两条汇编指令之间使用'\n'分隔开；
3. VAL：进行进制转换时，指定需要转换的数字，可以为二进制、八进制、十进制或十六进制；
4. PIC：获取 RGB24 格式的图像数据时，指定文件的名称（文件需要存放在 image 目录下，并且指定名称时需要带上后缀）。
5. FUNC：指定进行反编译的标号，默认指定：_start。
6. PLATFORM：指定运行 C 语言程序的平台（默认为 OIRV），若需要在本机运行，可指定该参数为 pc。

## 项目结构
1. LAB 目录包括了所有实验代码：
- asm 目录：存放最基础的 OIRV 启动汇编代码以及演示性质的代码，其中 basic.s 提供了结束程序运行的代码，不可修改它们；start.s 提供了一个最简单的代码模板，将它复制以后，可以书写自己的实验代码；其他汇编代码为演示代码；
- bin 目录：存放二进制程序数据文件以及 RGB24 图像数据文件，可自行增加内容，但不要删除原本已经存在的文件；
- build 目录：存放编译汇编文件过程中生成的内容（不能删除该目录）；
- image 目录：包含了项目中所使用的图片；
- utils 目录：存放 python 脚本文件，不要改动其中的内容；
- Makefile：自动化构建脚本，不要改动其中的内容；
- c 目录：存放 OIRV 启动代码（start.S）、链接脚本（bare.lds）以及 C 语言源代码。
2. OIRV 目录：该目录为执行 setup.sh 进行初始化时克隆的 OIRV 项目，它主要包括了构成 OIRV CPU 核的硬件描述语言文件以及项目构建脚本，实验过程中不需要改动该目录。
3. .gitignore 文件：git 仓库的内容忽略文件（不要改动）；
4. LICENSE 文件：项目协议文件，本项目开源协议采用 GPL v3。
5. oirv_model：生成的 OIRV 虚拟 CPU 仿真执行程序；
6. README.md：项目说明文档；
7. setup.sh 文件：用于项目初始化的 shell 脚本文件，该脚本将安装必要的软件包、下载 OIRV 项目并编译该项目以生成 OIRV 虚拟 CPU 的仿真执行程序。

## 其他说明
1. GITHUB 网址：https://github.com/langer0v0/PFA.git 为本项目的仓库；gitee 仓库只对其进行备份以方便用户获取，而不对该原始仓库进行修改。

## 参考资料
1. RISC-V 开源指令集官网：https://riscv.org
2. RISC-V 指令集：https://ai-embedded.com/risc-v/riscv-isa-manual/
3. RISC-V 在线反汇编器：https://luplab.gitlab.io/rvcodecjs/
4. OIRV 项目：https://github.com/secure-v/OIRV
