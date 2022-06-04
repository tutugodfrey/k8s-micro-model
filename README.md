[![tutugodfrey](https://circleci.com/gh/tutugodfrey/k8s-micro-model.svg?style=svg)](<https://app.circleci.com/pipelines/github/tutugodfrey>)

## Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API. 

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Tasks

Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

**The final implementation of the project will showcase your abilities to operationalize production microservices.**

---

## Setup the Environment

* Create a virtualenv with Python 3.7 and activate it. Refer to this link for help on specifying the Python version in the virtualenv. 
```bash
python3 -m pip install --user virtualenv
# You should have Python 3.7 available in your host. 
# Check the Python path using `which python3`
# Use a command similar to this one:
python3 -m virtualenv --python=<path-to-Python3.7> .devops
source .devops/bin/activate
```
* Run `make install` to install the necessary dependencies

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Upload Docker image to docker registry: `./upload_docker.sh`
4. Run in Kubernetes:  `./run_kubernetes.sh`
5. Make prediction with a running app: `./make_prediction.sh` (This can be use both for docker and kubernetes)


# Other files and their functions
1. Directory containing the trained model we are using for prediction `model_data` (This is also copied into the docker container)
2. Dockerfile to containerize the application: `Dockerfile`
6. Sample Output of running docker container and making prediction: `cat docker_out.txt`
7. Sample output of running kubernetes and making prediction: `cat kubernetes_out.txt`

### Kubernetes Steps

* Setup and Configure Docker locally
* Setup and Configure Kubernetes locally
* Create Flask app in Container
* Run via kubectl


# Python virtual environment

You can also setup python virtual environment with the following two commands.

```bash
python3 -m venv ~/.devops
```

```bash
source ~/.devops/bin/activate
```

# Install hadolint

```bash
sudo wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64
```

```bash
sudo chmod +x /bin/hadolint
```

# build docker image, run a container

```bash
./run_docker.shc9
```
If the above is successful, make a prediction

```bash
./make_prediction.sh 
```

# To Log the container

```bash
docker logs -f container-name-here
```

# Environment variables
You can set all of this environment variable to override those set in the scripts

**IMAGE_REPO=**: Your docker registry
**IMAGE_NAME=**: name of the image to create
**IMAGE_TAG=**: Tag to creae
**IMAGE_PORT=**: Port exposed in Dockerfile
**CONTAINER_NAME=**: Name of the docker container to create (when running `run_docker.sh`)
**CONTAINER_PORT=**: Port to map to the docker container
**DEPLOYMENT_NAME=**: Name of the deployment to create

**NOTE:**
The scripts used in this project assume some default environment variables that can be overriden by setting your own environment variables that follows the naming in the scripts. If done properly, you should be able to execute the scripts without editing them. Please make sure you are consistent with the variable names across the scripts to avoid getting errors.
