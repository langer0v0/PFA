#!/bin/sh

CUR_PATH=`pwd`

if [ -f "$CUR_PATH/oirv_model" ]; then
    echo "\033[32mEnvironment configuration completed OvO!\033[0m"
    make -C $CUR_PATH/LAB file SRC=display_image #  > $CUR_PATH/LAB/start.log
    make -C $CUR_PATH/LAB SRC=hello > $CUR_PATH/LAB/start.log
    rm $CUR_PATH/LAB/start.log
    exit 0
fi


case "$PREFIX" in
*com.termux*) 
    # echo "Termux!"
    pkg upgrade -y
    pkg install -y --no-upgrade git
    pkg install -y --no-upgrade wget
    pkg install -y --no-upgrade man
    pkg install -y --no-upgrade binutils
    pkg install -y --no-upgrade python3
    pkg install -y openssl-tool
    # pkg install -y --no-upgrade openssl
    pkg install -y --no-upgrade help2man
    pkg install -y --no-upgrade perl
    pkg install -y --no-upgrade make
    pkg install -y --no-upgrade autoconf
    pkg install -y --no-upgrade clang
    pkg install -y --no-upgrade flex
    pkg install -y --no-upgrade bison
    pkg install -y --no-upgrade ccache
    pkg install -y --no-upgrade mold
    pkg install -y --no-upgrade which

    pkg install -y --no-upgrade ffmpeg
    ;;
*)
    if command -v dnf >/dev/null 2>&1; then # fedora
        sudo dnf install verilator -y
        sudo dnf install clang -y
        sudo dnf install python -y
        sudo dnf install ffmpeg -y
        sudo dnf install make -y
    else
        sudo apt-get install verilator -y
        sudo apt-get install clang -y
        sudo apt-get install python -y
        sudo apt-get install ffmpeg -y
        sudo apt-get install make -y

        # ubuntu 2204
                    # sudo apt-get install -y --no-upgrade git
                    # sudo apt-get install -y --no-upgrade wget
                    # sudo apt-get install -y --no-upgrade man
                    # sudo apt-get install -y --no-upgrade binutils
                    # sudo apt-get install -y --no-upgrade openssl
                    # sudo apt-get install -y --no-upgrade help2man
                    # sudo apt-get install -y --no-upgrade perl
                    # sudo apt-get install -y --no-upgrade python3
                    # sudo apt-get install -y --no-upgrade make
                    # sudo apt-get install -y --no-upgrade autoconf
                    # sudo apt-get install -y --no-upgrade clang
                    # sudo apt-get install -y --no-upgrade flex
                    # sudo apt-get install -y --no-upgrade bison
                    # sudo apt-get install -y --no-upgrade ccache
                    # sudo apt-get install -y --no-upgrade mold
                    # sudo apt-get install -y --no-upgrade which

        # DO NOT NEED INSTALL IN TERMUX !!!
                    # sudo apt-get install -y --no-upgrade libgoogle-perftools-dev
                    # sudo apt-get install -y --no-upgrade numactl
                    # sudo apt-get install -y --no-upgrade perl-doc
                    # sudo apt-get install -y --no-upgrade libfl2
                    # sudo apt-get install -y --no-upgrade libfl-dev
                    # sudo apt-get install -y --no-upgrade zlib1g
                    # sudo apt-get install -y --no-upgrade zlib1g-dev
        # zlibc # ubuntu2204 do not need

    fi
    ;;
esac

pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
pip install capstone

if command -v verilator >/dev/null 2>&1; then
    echo "\033[32mVerilator has been installed OvO!\033[0m"
else
    if [ ! -f "$HOME/eda/verilator/bin/verilator_bin" ]; then
        echo "=============================== DOWNLOAD VERILATOR ================================"
        mkdir -p ~/eda
        cd ~/eda
        git clone https://gitee.com/mirrors/Verilator.git ~/eda/verilator # github: https://github.com/verilator/verilator
        # unsetenv VERILATOR_ROOT
        # unset VERILATOR_ROOT
    fi

    cd ~/eda/verilator
    git checkout 749b034 # v5.031
    echo "================================ INSTALL VERILATOR ================================"
    autoconf 
    ./configure --prefix $PREFIX
    # ./configure
    make -C ~/eda/verilator -j`nproc` 
    make install
fi


cd $CUR_PATH


if [ ! -d "OIRV" ]; then
    git clone --depth=1 https://gitee.com/langer0v0/OIRV.git
fi


echo "====================================== OIRV ======================================="
make -C $CUR_PATH/LAB file SRC=display_image #  > $CUR_PATH/LAB/start.log
make -C $CUR_PATH/LAB SRC=hello > $CUR_PATH/LAB/start.log
rm $CUR_PATH/LAB/start.log
