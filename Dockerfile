FROM alpine/git as clone
WORKDIR /app
RUN git clone https://github.com/Blarne/ew-keycloak-plugin

FROM maven:3.6.3-jdk-11 as build
WORKDIR /app
COPY --from=clone /app/ew-keycloak-plugin /app
RUN mvn install

FROM jboss/keycloak:8.0.1
MAINTAINER miroslav.svoboda@eurowag.com

#USER 1000
ADD ew-realm-uat.json /opt/jboss/keycloak/
ADD eurowag-themes /opt/jboss/keycloak/themes 
java -cp ew-keycloak-plugin-1.0.0-SNAPSHOT.jar 

COPY --from=build /app/target/ew-keycloak-plugin-1.0.0-SNAPSHOT.jar /opt/jboss/keycloak/standalone/deployments
WORKDIR /opt/jboss/keycloak/standalone/deployments
CMD java -cp ew-keycloak-plugin-1.0.0-SNAPSHOT.jar com.karumien.cloud.sso.api.messages.DownloadMessages 81aece182069bf337a21c6d7803983bd 331203 /opt/jboss/keycloak/themes/clientzone/login/messages de-at:at,bg,cs,de,da:dk,et:ee,en,es,fr,hu,it,lt,lv,nl,pl,pt,ro,ru,sl:si,sk,sr,sv,tr
CMD java -cp ew-keycloak-plugin-1.0.0-SNAPSHOT.jar com.karumien.cloud.sso.api.messages.DownloadMessages 81aece182069bf337a21c6d7803983bd 331203 /opt/jboss/keycloak/themes/eurowag/login/messages de-at:at,bg,cs,de,da:dk,et:ee,en,es,fr,hu,it,lt,lv,nl,pl,pt,ro,ru,sl:si,sk,sr,sv,tr

ENTRYPOINT [ "/opt/jboss/tools/docker-entrypoint.sh" ]

#CMD ["-b", "0.0.0.0", "-Dkeycloak.import=/opt/jboss/keycloak/ew-realm-uat.json"]
CMD ["-b", "0.0.0.0"]
