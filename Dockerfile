FROM jboss/keycloak:7.0.1
MAINTAINER miroslav.svoboda@karumien.com

#USER root
#RUN microdnf install -y chrony --enablerepo=rhel-7-server-rpms
#RUN systemctl enable chronyd
#ADD chrony.conf /etc

#USER 1000
ADD ew-realm.json /opt/jboss/keycloak/

ENTRYPOINT [ "/opt/jboss/tools/docker-entrypoint.sh" ]

CMD ["-b", "0.0.0.0", "-Dkeycloak.import=/opt/jboss/keycloak/ew-realm.json"]