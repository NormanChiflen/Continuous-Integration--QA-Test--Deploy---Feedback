#!/bin/bash

# Tell bash to abort the script if any error happens
set -e

APPNAME=MyApp
DSTROOT=/tmp/MyApp

xcodebuild -sdk iphonesimulator5.0 \
           -arch i386 \
           install DSTROOT="$DSTROOT"

waxsim "$DSTROOT"/Applications/"$APPNAME".app
