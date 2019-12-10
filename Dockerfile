FROM jboss/keycloak:8.0.1
MAINTAINER miroslav.svoboda@eurowag.com

#USER root
#RUN microdnf install -y chrony --enablerepo=rhel-7-server-rpms
#RUN systemctl enable chronyd
#ADD chrony.conf /etc

#USER 1000
ADD ew-realm-uat.json /opt/jboss/keycloak/
ADD eurowag-themes /opt/jboss/keycloak/themes 

ENTRYPOINT [ "/opt/jboss/tools/docker-entrypoint.sh" ]

#CMD ["-b", "0.0.0.0", "-Dkeycloak.import=/opt/jboss/keycloak/ew-realm-uat.json"]
CMD ["-b", "0.0.0.0"]
