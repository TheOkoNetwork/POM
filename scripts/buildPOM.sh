#!/bin/bash

echo "building POM"
cd public/js
npm install --also=dev
echo "building POM app"
npx webpack --config app.webpack.config.js