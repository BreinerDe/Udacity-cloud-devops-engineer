
# Overview

[![Python application](https://github.com/BreinerDe/Udacity-cloud-devops-engineer/actions/workflows/python-app2.yml/badge.svg)](https://github.com/BreinerDe/Udacity-cloud-devops-engineer/actions/workflows/python-app2.yml)


This repositry demonstrates:
- Deploying the app in Azure CloudShell
- Deploying the app as a web server using Azure App Service.
 

## Project Plan

To keep track of the progress a [Trello](https://trello.com/b/TmjHDSjs/udacity-project-2) board has been created.

A [spreadsheet](Udacity-project-2-spreadsheet.xlsx) has been created to plan the development.


## Architecture

![architecture diagram  ](https://raw.githubusercontent.com/BreinerDe/Udacity-cloud-devops-engineer/main/screenshots/architecture%20diagram.png)


## Instructions

Here is an architectural diagram:
xx

## Deploy the app in Azure Cloud Shell

In Azure Cloud Shell, clone the repo:
```
git clone git@github.com:BreinerDe/Udacity-cloud-devops-engineer.git
```
![git clone cloudshell.png](https://raw.githubusercontent.com/BreinerDe/Udacity-cloud-devops-engineer/main/screenshots/git%20clone%20cloudshell.png)

Create a virtual environment:
```
python3 -m venv ~/.myrepo
```
Activate the virtual environment:
```
source ~/.myrepo/bin/activate
```
Change into the new directory:
```
cd Udacity-cloud-devops-engineer
```
Install dependencies in the virtual environment and run tests:
```
make all
```

![pass test cloudshell.png](https://raw.githubusercontent.com/BreinerDe/Udacity-cloud-devops-engineer/main/screenshots/pass%20test%20cloudshell.png)

### Running GitHub Actions

Every push to the repository will trigger a GitHub Action which runs a pipeline to test the code.

![passing github action.png](https://raw.githubusercontent.com/BreinerDe/Udacity-cloud-devops-engineer/main/screenshots/passing%20github%20action.png)



## Deploying the App

To deploy this app create an App Service in Azure using the Azure Cloud Shell or the CLI locally
```
az webapp up -n cicd-nanodegree-dennis -g udacity-resources
```

Now create a pipeline in Azure Devops to automate the deployment:

* Go to https://dev.azure.com and sign in.
* Create a new private project. 
* Create a new service connection to Azure Resource Manager, select subscription and the app service.
* Create a new pipeline linked to your GitHub repo using a GitHub Yaml File.
* Check [official documentation](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops) for more information 

Deployed Azure App Service

![azure app service.png](https://raw.githubusercontent.com/BreinerDe/Udacity-cloud-devops-engineer/main/screenshots/azrue%20app%20service.png)

Successful deployment

![passing github action.png](https://raw.githubusercontent.com/BreinerDe/Udacity-cloud-devops-engineer/main/screenshots/successful%20deployment.png)

### Manual Testing

To test the app modify line 28 of the [test script](./make_predict_azure_app.sh) and replace the URI with the URI of your App Service.

Execute the script and check the output
```
./make_predict_azure_app.sh     
````

![testing.png](https://raw.githubusercontent.com/BreinerDe/Udacity-cloud-devops-engineer/main/screenshots/testing.png)

You can also access the App in the Browser to see if its up and running

![app service browser.png](https://raw.githubusercontent.com/BreinerDe/Udacity-cloud-devops-engineer/main/screenshots/app%20service%20browser.png)


You can check the log via 

```
https://cicd-nanodegree-dennis.scm.azurewebsites.net/api/logs/docker
```
![log.png](https://raw.githubusercontent.com/BreinerDe/Udacity-cloud-devops-engineer/main/screenshots/log.png)

## Enhancements

Add Application insights to improve logging and Analysis


## Load testing

Use locust to load test our App

Install locust:
```
pip install locust
```
Ensure the app is running:
```
python app.py
```

Start locust:
```
locust
```
Open a browser and go to [http://localhost:8089](http://localhost:8089). Enter the total number of users to simulate, spawn rate, set the host to your app-service, and click Start Swarming:

![locust settings](https://raw.githubusercontent.com/BreinerDe/Udacity-cloud-devops-engineer/main/screenshots/locust%20settings.png)

Result of the load test:

![locust-test](https://raw.githubusercontent.com/BreinerDe/Udacity-cloud-devops-engineer/main/screenshots/locust%20test.png)



## Demo Video

https://www.youtube.com/watch?v=gHePPEsdSc8
