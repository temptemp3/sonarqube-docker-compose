# sonarqube-docker-compose

Docker compose recipes for extending tho [official Docker image for Sonarqube](https://github.com/SonarSource/docker-sonarqube).

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
- default
  + installs python golang and scala plugins
  + removes preinstalled java and web related, xml and javascrapt
- drop-in other to roll your own
