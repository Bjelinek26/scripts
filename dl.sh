#!/bin/bash

ARG=$1 #full path of the file to be moved (so the user can take advantage of auto-completion)
BASE=$(basename $ARG)
DIR=$(dirname $ARG)
FUT=$(pwd)/$BASE #full path of the file after it is moved


#dislpay the content of the directory you are moving the file from
#and the directory you are moving it to
#ToDo: add diff functionality
function check(){
    echo ""
    echo "current listing of ${DIR}:"
    echo ""
    ls $DIR
    echo ""
    echo "current listing of $(pwd):"
    echo ""yotel
    ls 
    echo ""
}

function reader(){
    read -p "press 1 to view script, 2 to quit " ANS   
}

if [ -e $FUT ]
then 
    echo ""
    echo "file already exits in the current directory"
    check
    echo "contents of ${BASE} in ${DIR}:"
    echo ""
    cat $ARG
    echo ""
    echo "contents of ${BASE} in $(pwd)"
    echo ""
    cat $FUT
    exit 3
fi

mv $ARG "$(pwd)"

#check for errors and allow the user to look at and edit the 
#script via the reader function
if [ -e $BASE ]
then
    echo ""
    echo "moving ${BASE} to $(pwd)"
    check
elif [ -e $ARG ]
then
    echo "" 
    echo "command failed ${BASE} still exits in ${DIR}"
    check
    reader 
else
    echo ""
    echo "something unexpected has occurred"
    echo "check script"
    reader
fi

case "$ANS" in 
    1)
    vim /opt/Scripts/dl.sh
    ;;
    2)
    exit 2
    ;;
esac
