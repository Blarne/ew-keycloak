FROM alpine/git as clone
WORKDIR /app
RUN git clone https://github.com/Blarne/ew-keycloak-plugin

FROM maven:3.6.3-jdk-11 as build
WORKDIR /app
COPY --from=clone /app/ew-keycloak-plugin /app
RUN mvn install

FROM jboss/keycloak:8.0.1
MAINTAINER miroslav.svoboda@eurowag.com

#USER root
#RUN microdnf install -y chrony --enablerepo=rhel-7-server-rpms
#RUN systemctl enable chronyd
#ADD chrony.conf /etc

#USER 1000
ADD ew-realm-uat.json /opt/jboss/keycloak/
ADD eurowag-themes /opt/jboss/keycloak/themes 
COPY --from=build /app/target/ew-keycloak-plugin-1.0.0-SNAPSHOT.jar /opt/jboss/keycloak/standalone/deployments

ENTRYPOINT [ "/opt/jboss/tools/docker-entrypoint.sh" ]

#CMD ["-b", "0.0.0.0", "-Dkeycloak.import=/opt/jboss/keycloak/ew-realm-uat.json"]
CMD ["-b", "0.0.0.0"]
