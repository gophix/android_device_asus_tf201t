#!/bin/sh

SYSDIR=$1
if [ "x$SYSDIR" = "x" ]; then
echo "You must specify system directory as first argument";
exit
fi
BASE=../../../vendor/asus/tf300t/proprietary
rm -rf $BASE/*

FILES=`cat proprietary-files.txt`
for FILE in $FILES; do
    DIR=`dirname $FILE`
    if [ ! -d $BASE/$DIR ]; then
        mkdir -p $BASE/$DIR
    fi
    cp $SYSDIR/$FILE $BASE/$FILE
done

# Check MD5 sums of proprietary files
(cd $BASE; md5sum $FILES) | \
    diff -u proprietary-files.md5sum -
if [ $? != 0 ]; then
    echo
    echo "MD5 mismatch on proprietary files."
    echo "Your build might not work with these files."
    echo
    echo "If you know, what you are doing, please run ./setup-makefiles.sh manually."
    echo
    exit 1
fi

./setup-makefiles.sh

