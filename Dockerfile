FROM alpine/git as clone
WORKDIR /app
RUN git clone https://github.com/Blarne/ew-keycloak-plugin

FROM maven:3.6.3-jdk-11 as build
WORKDIR /app
COPY --from=clone /app/ew-keycloak-plugin /app
RUN mvn install
RUN java -cp /app/target/ew-keycloak-plugin-1.0.0-SNAPSHOT.jar com.karumien.cloud.sso.api.messages.DownloadMessages 442c1a0e6e6b461b91dd72f025ba47bd 331203 /app/target de-at:at,bg,cs,de,da:dk,et:ee,en,es,fr,hu,it,lt,lv,nl,pl,pt,ro,ru,sl:si,sk,sr,sv,tr

FROM jboss/keycloak:10.0.1

ADD ew-realm-uat.json /opt/jboss/keycloak/
ADD eurowag-themes /opt/jboss/keycloak/themes 

COPY --from=build /app/target/ew-keycloak-plugin-1.0.0-SNAPSHOT-jar-with-dependencies.jar /opt/jboss/keycloak/standalone/deployments/ew-keycloak-plugin-1.0.0-SNAPSHOT.jar
COPY --from=build /app/target/messages*.* /opt/jboss/keycloak/themes/clientzone/login/messages/
COPY --from=build /app/target/messages*.* /opt/jboss/keycloak/themes/eurowag/login/messages/

USER root
RUN microdnf install -y iputils

USER 1000
ENTRYPOINT [ "/opt/jboss/tools/docker-entrypoint.sh" ]

#CMD ["-b", "0.0.0.0", "-Dkeycloak.import=/opt/jboss/keycloak/ew-realm-uat.json"]
CMD ["-b", "0.0.0.0"]
