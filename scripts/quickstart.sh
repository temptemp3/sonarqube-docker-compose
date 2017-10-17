#!/bin/bash
_() {
	 git clone https://github.com/temptemp3/sonarqube-docker-compose.git
	 cd sonarqube-docker-compose
	 docker build --tag sonar_dc:latest --no-cache --force-rm .
	 docker-compose up
}
_
