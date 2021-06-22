#!/bin/bash

echo "Prettifying server"
npx prettier -w index.js

echo "Lint checks server"
npx standard --fix index.js

if [ $? != 0 ];then
	exit $?
fi