#FROM temptemp3/test
FROM sonarqube

#MAINTAINER spiddy <d.kapanidis@gmail.com>

#RUN apt-get update && apt-get install -qy apt-transport-https
#RUN echo "deb http://downloads.sourceforge.net/project/sonar-pkg/deb binary/" >> /etc/apt/sources.list

#RUN apt-get update && apt-get clean ### Sonar version 5.6 - timestamp
#RUN apt-get install -y --force-yes sonar=5.6

#RUN  apt-get update
#RUN  apt-get clean
#RUN  apt-get install sonar -y --force-yes


COPY init /app/init
RUN chmod 755 /app/init

VOLUME /opt/sonar/extensions
VOLUME /opt/sonar/logs/

ENTRYPOINT ["/opt/sonar/bin/linux-x86-64/sonar.sh"]
CMD ["start"]

