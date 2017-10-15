FROM sonarqube

COPY init /app/init
RUN chmod 755 /app/init

VOLUME /opt/sonarqube/conf
VOLUME /opt/sonarqube/data
VOLUME /opt/sonarqube/extensions
VOLUME /opt/sonarqube/lib/bundled-plugins

ENTRYPOINT ["/app/init"]
CMD ["start"]
