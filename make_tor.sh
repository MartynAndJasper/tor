#!/bin/sh

# https://www.torproject.org/docs/tor-doc-unix
# https://www.gnu.org/software/automake/manual/html_node/GNU-Build-System.html
# https://www3.ntu.edu.sg/home/ehchua/programming/cpp/gcc_make.html

# Currently using:
# >git submodule add https://github.com/kobolabs/liblzma third_party/liblzma
# >git submodule add https://github.com/facebook/zstd third_party/zstd
# >git submodule add https://github.com/systemd/systemd third_party/systemd
# >git submodule add https://git.torproject.org/tor.git third_party/tor
# >git submodule add https://github.com/openssl/openssl third_party/openssl
# >git submodule add https://github.com/libevent/libevent.git third_party/libevent
# >git submodule add https://github.com/madler/zlib third_party/zlib

#################
# Clone and setup
#################
#>git clone https://mart7n@bitbucket.org/thebrownbrothers/tor.git tor
#>cd tor
#>tor_install_tools.sh 
#^^^ Once only
#>tor_build.sh

. ./helpers.sh

build_tor_and_dependancies()
{    
    git submodule update --init --recursive    

    mkdir ${BUILD_PATH}
    mkdir ${THIRDPARTY_PATH}
    
    # Building OpenSSL
    # https://github.com/openssl/openssl
    cd ./third_party/openssl
    ./Configure --prefix=${THIRDPARTY_PATH}
    make
    make test
    make install

    # Building Libevent
    # https://github.com/libevent/libevent.git
    # https://github.com/openssl/openssl/blob/master/NOTES-UNIX.md
    cd ../libevent
    ./autogen.sh
    ./configure --prefix=${THIRDPARTY_PATH} 
    make
    make verify
    make install
    
    # Building zlib    
    # https://github.com/madler/zlib
    cd ../zlib
    ./configure --prefix=${THIRDPARTY_PATH} 
    make
    make test
    make install

    # Building liblzma
    # https://github.com/kobolabs/liblzma
    cd ../liblzma
    ./autogen.sh
    ./configure --prefix=${THIRDPARTY_PATH} 
    make
    make check
    make install

    # Building libzstd
    # https://github.com/facebook/zstd
    cd ../zstd
    make
    make check 
    make prefix=${THIRDPARTY_PATH} install

    # Building systemd
    # https://systemd.io/
    # https://github.com/systemd/systemd
    # cd ../systemdfa
    # ./configure --prefix=${THIRDPARTY_PATH} 
    # MANY missing dependancies, will return to this if needed.

    # Building TOR
    cd ../tor
    ./autogen.sh
    ./configure --disable-asciidoc --with-libevent-dir=${THIRDPARTY_PATH} --prefix=${THIRDPARTY_PATH}  --with-zlib-dir=${THIRDPARTY_PATH} 
    #/configure --disable-asciidoc --with-libevent-dir=/usr/local --with-zlib-dir=/usr/local --includedir=/usr/local/include
    make
    make install
}

if [ $# -eq 0 ]
then
    ./paths_tor.sh 1 ./make_tor.sh 2
    exit 0
else
    #echo Seconds call
    stage=$1
    #echo stage=${stage}

    if [ ${stage} -eq 2 ]
    then
        echo Building Tor
        echo ------------
        echo_export_build_params
        echo ------------

        #exit 
        build_tor_and_dependancies
    fi
fi
