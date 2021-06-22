#!/bin/bash

project=$1

image=gcr.io/$project/pom
region=europe-north1

gcloud config set project $project

function deployService {
	service=pom
	echo "Deploying POM from image: $image to service: $service"
	gcloud run deploy $service --image $image --platform managed --region $region
}

echo "Prettifying server"
npx prettier -w index.js

echo "Lint checks server"
npx standard --fix index.js

if [ $? != 0 ];then
	exit $?
fi

echo "Building container image: $image"
gcloud builds submit --tag $image

deployService