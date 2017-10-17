#!/bin/bash
## needs revisions
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
