#!/usr/bin/env bash

# deploy the app as an app service
az webapp up -n cicd-nanodegree-dennis -g udacity-resources

#clone the repo
git clone https://github.com/BreinerDe/Udacity-cloud-devops-engineer.git

#switch to directory
cd Udacity-cloud-devops-engineer

#setup venv
python3.7 -m venv python37
source python37/bin/activate

#build project
make all

#deploy webapp
az webapp up -n cicd-nanodegree-dennis -g udacity-resources



