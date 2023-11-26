<h1 align="center">Sample Flask App</h1>

<h1 align="center">
    <a href=https://flask.palletsprojects.com/en/3.0.x/>🔗 Flask</a>
</h1>
<p align="center">🚀 This is a Python application using Flask</p>

### Features (Routes)

- [x] Hello world
- [x] Time stamp w/ personalized message
- [x] Health Check

### How to build and run locally

#### Install Docker or any other container tool


###### Clone that repo
```bash
$ git clone https://github.com/andrelsyoo/py-flask-app-sample2.git
```

###### Build the image
```bash
$ docker build -t my-python-app .
```

###### Run the container
```bash
$ docker run -p 8080:8080 my-python-app
```

### How to use AWS ECR 

###### Tag the image
```bash
$ docker tag py-flask-sample:latest {AWS_ACCOUNT_ID}.dkr.ecr.us-east-2.amazonaws.com/py-flask-sample:latest
```

###### Push the image
```bash
$ docker push {AWS_ACCOUNT_ID}.dkr.ecr.us-east-2.amazonaws.com/py-flask-sample:latest
```