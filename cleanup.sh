#!/usr/bin/env bash
DIR=$1
LIMIT=$2

if [ "$DIR" == "" ]; then
	echo "ERROR: directory not specified"
	exit 1
fi

DIR=`realpath $DIR`

if [ ! -d $DIR ]; then
	echo "ERROR: directory '$DIR' does not exist"
	exit 1
fi

if [ "$LIMIT" == "" ]; then
	LIMIT=95
fi

echo Cleaning $DIR to $LIMIT%...
CAPACITY=100

for FILE in `find $DIR -type f -printf "%TY-%Tm-%TdT%TT %p \n" | sort -n | cut -d " " -f 2`; do
	CAPACITY=$( df $DIR | tail -1 | awk '{print $5}' | tr -d '%' )

	if [ $CAPACITY -le $LIMIT ]; then
		break
	fi

	echo DELETE FILE $FILE
	rm --force $FILE
done

echo Done - $CAPACITY!
