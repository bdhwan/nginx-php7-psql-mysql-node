#!/bin/bash
echo "ok"
echo "GIT_URL: "$GIT_URL
echo "DST_FOLDER: "$DST_FOLDER


if [ -z "$GIT_URL" ]
then
    echo "not defined GIT_URL"
else 
    git clone "$GIT_URL"
    rm -rf /var/www/html
    if [ -z "$DST_FOLDER" ]
    then
        echo "not defined DST_FOLDER"
        mv "$(basename "$GIT_URL" .git)" /var/www/html
    else 
        echo "defined =" $DST_FOLDER
        cd "$(basename "$GIT_URL" .git)"
        mv $DST_FOLDER /var/www/html
    fi
fi



