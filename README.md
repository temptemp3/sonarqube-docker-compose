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

- used to build `sonar_dc:latest` image from the official Docker image for Sonarqube
- configures entry point

**docker-compose.yml**

- compose using `sonar_dc:latest` image 

**init**

- contains extend procedures
- default
  + installs python golang and scala plugins
  + removes preinstalled java and web related, xml and javascrapt
  + as in [examples/init-install-plugins-go-python-scala](https://github.com/temptemp3/sonarqube-docker-compose/blob/master/examples/init-install-plugins-go-python-scala)
- drop-in other to roll your own

## extras

### sonar scanner

#### install

#### linux

```
( 
  cd ~
  wget https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.0.3.778-linux.zip
  sudo apt-get install unzip
  unzip sonar-scanner-cli-3.0.3.778-linux.zip
  rm -rvf sonar-scanner-cli-3.0.3.778-linux.zip
  cat >> .bashrc << EOF
alias sonar-scanner='~/sonar-scanner-3.0.3.778-linux/bin/sonar-scanner'
_sonar-scanner() { { local project_key ; project_key="${1}" ; }
 sonar-scanner \
        -Dsonar.host.url=http://localhost:9000 \
        -Dsonar.jdbc.url=jdbc:postgresql://localhost/sonar \
        -Dsonar.projectKey=${project_key} \
        -Dsonar.sources=.
}
_sonar-provision-git() {
	git clone ${1}
	cd $( basename ${1} .git )
	_sonar-scanner $( basename ${1} .git )
}
EOF
)
```
