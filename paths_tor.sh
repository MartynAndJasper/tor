#!/bin/sh

. ./helpers.sh

if [ $# -eq 0 ]
then
    echo ---------------------------------
    echo Previous build params
    display_build_params
    export_build_params
    echo ---------------------------------
    echo Current build params
    echo_export_build_params
    echo
else    
    stage=$1

    case ${stage} in
        1)
            export_build_params
            shift                        
            exec "$@"
        ;;

        2)
            # Todo
        ;;

        *)
            # Todo
        ;;
    esac     
fi

exit
