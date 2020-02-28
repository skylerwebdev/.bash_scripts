#!/bin/bash

echo What would you like to name your app?

read appname

if [ -d "$appname" ]; then
    echo "$appname exists"
else
    npx create-react-app "$appname"
fi
