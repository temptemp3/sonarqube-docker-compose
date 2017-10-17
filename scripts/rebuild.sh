#!/bin/bash
_() {
docker build --tag sonar_dc:latest --no-cache --force-rm .
docker-compose rm -fv
docker-compose up
}
_
