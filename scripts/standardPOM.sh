#!/bin/bash

echo "Style checking POM js SRC"
cd public/js

echo "Prettier"
find ./src|grep "\.js"| xargs -r -E '' -t npx prettier --write

echo "Standard JS"
find ./src|grep "\.js"| xargs -r -E '' -t npx standard --fix