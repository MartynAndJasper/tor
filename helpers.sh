#!/bin/sh

#echo {$0} arg count: $#
#echo {$0} args: $@ 
#echo {$0} arg1: $1 

display_build_params()
{
    echo REPO_PATH="${REPO_PATH}"
    echo BUILD_PATH="${BUILD_PATH}"
    echo THIRDPARTY_PATH="${THIRDPARTY_PATH}"
    echo LD_LIBRARY_PATH="${LD_LIBRARY_PATH}"
    echo CPATH="${THIRDPARTY_PATH}"
    echo LIBRARY_PATH="${LIBRARY_PATH}"    
}

export_build_params()
{
    REPO_PATH=$(pwd)
    export REPO_PATH=${REPO_PATH}
    export BUILD_PATH=${REPO_PATH}/build
    export THIRDPARTY_PATH=${BUILD_PATH}/third_party
    export LD_LIBRARY_PATH=${THIRDPARTY_PATH}/lib
    export CPATH=${THIRDPARTY_PATH}/include
    export LIBRARY_PATH=${THIRDPARTY_PATH}/lib 
    #export LD_LIBRARY_PATH=${THIRDPARTY_PATH}/lib:$LD_LIBRARY_PATH
}

echo_export_build_params()
{    
    echo export REPO_PATH=${REPO_PATH}
    echo export BUILD_PATH=${REPO_PATH}/build
    echo export THIRDPARTY_PATH=${BUILD_PATH}/third_party
    echo export LD_LIBRARY_PATH=${THIRDPARTY_PATH}/lib
    echo export CPATH=${THIRDPARTY_PATH}/include
    echo export LIBRARY_PATH=${THIRDPARTY_PATH}/lib     
}
