# sonarqube-docker-compose

Docker compose recipe for extending tho [official Docker image for Sonarqube](https://github.com/SonarSource/docker-sonarqube) consisting of: Dockerfile; docker-compose.yml; and init. Use to build image derived from init changes on sonarqube image and compose services. 

## quickstart

```
_() {
  (
    git clone https://github.com/temptemp3/sonarqube-docker-compose.git
    cd sonarqube-docker-compose
    docker build --tag sonar_dc:latest --no-cache --force-rm .
    docker-compose up
  )
}
_
```

## rebuild

```
_() {
docker build --tag sonar_dc:latest --no-cache --force-rm .
docker-compose rm -fv
docker-compose up
}
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

see [Analyzing with SonarQube Scanner](https://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner)

#### install

##### linux

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
 _() {
   git clone ${1} ${2}
   (
     cd $( basename ${1} .git )
     _sonar-scanner $( basename ${1} .git )
   )
 }
 case ${#} in
  1|2) {
   _ ${@}
  } ;;
  0) {
   while [ ! ]
   do
    echo adsf
    read input
    _ ${input}
   done 
  } ;;
  *) {
   true
  } ;;
 esac
}
EOF
)
```
#### using commands

##### \_sonar-scanner

```
# trigger sonar scan in working directory
_sonar-scanner PROJECT_KEY
```

##### \_sonar-provision-git

```
# add sonarqube-docker-compose project to sonarqube
_sonar-provision-git https://github.com/temptemp3/sonarqube-docker-compose.git 
```

### mvn sonar

see [Analyzing a Maven Project](https://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner+for+Maven)

```
## using mvn 
# _mvn-sonar - trigger sonar
# - run in base of maven
_mvn-sonar() {
 mvn \
	sonar:sonar \
	-Dsonar.host.url=http://localhost:9000 \
 	-Dsonar.jdbc.url=jdbc:postgresql://localhost/sonar \
	-X
}
# _mvn-init() - initialize maven
# - creates maven base
_mvn-init() {
 mvn \
	archetype:generate \
	-DgroupId=${1} \
	-DartifactId=${1} \
	-DarchetypeArtifactId=maven-archetype-quickstart \
	-DinteractiveMode=false
}
```
