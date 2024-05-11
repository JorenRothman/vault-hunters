# syntax=docker/dockerfile:1

FROM openjdk:8u312-jre-buster

LABEL version="1.13.9H"

RUN apt-get update && apt-get install -y curl && \
    adduser --uid 99 --gid 100 --home /data --disabled-password minecraft

COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

USER minecraft

VOLUME /data
WORKDIR /data

EXPOSE 25565/tcp

ENV JAVA_OPTS "-Xms4096m -Xmx4096m"

CMD ["/launch.sh"]
