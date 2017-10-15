# sonarqube-docker-compose

docker compose recipe for extending official sonarqube docker image 

## quickstart

```
_() {
 git clone https://github.com/temptemp3/sonarqube-docker-compose.git
 cd sonarqube-docker-compose
 docker build --tag sonar_dc:latest --no-cache .
 docker-compose up
}
_
```

## get

```
git clone https://github.com/temptemp3/sonarqube-docker-compose.git
```

## build

```
docker build --tag sonar_dc:latest --no-cache .
```

## compose

```
docker-compose up
```

## files 

- Dockerfile
- docker-compose.yml
- init

**Dockerfile**

- used by build sonar_dc:latest
- configures entry point

**docker-compose.yml**

- compose using sonar_dc:latest 

**init**

- contains extend procedures

