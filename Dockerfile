FROM openjdk:12-alpine

ENV TMPDIR /tmp/esigate
RUN set -xe \
	&& mkdir -p "$TMPDIR" 

ENV ESIGATE_HOME /usr/local/esigate
RUN mkdir -p "$ESIGATE_HOME"
RUN mkdir -p "$ESIGATE_HOME/bin"
RUN mkdir -p "$ESIGATE_HOME/etc"
RUN mkdir -p "$ESIGATE_HOME/log"
RUN mkdir -p "$ESIGATE_HOME/extensions"
RUN mkdir -p "$ESIGATE_HOME/work"
WORKDIR $ESIGATE_HOME

RUN wget -O esigate-server.jar https://search.maven.org/remotecontent?filepath=org/esigate/esigate-server/5.3/esigate-server-5.3.jar

EXPOSE 8080
EXPOSE 8081

ENTRYPOINT java  -server  -Desigate.config=/usr/local/esigate/etc/esigate.properties -Dserver.extraClasspath="$(echo /usr/local/esigate/extensions/*.jar | tr ' ' ':')" \
      -Djava.io.tmpdir=$TMPDIR -Dlog4j.configuration=file:///usr/local/esigate/etc/log4j.properties   $JAVA_OPTIONS -jar "/usr/local/esigate/esigate-server.jar" start
 
