FROM ubuntu
MAINTAINER Zach Latta <zach@zachlatta.com>

RUN apt-get update
RUN apt-get install -y openjdk-6-jre-headless

RUN useradd -s /bin/bash -m minecraft

ADD https://s3.amazonaws.com/Minecraft.Download/versions/1.7.2/minecraft_server.1.7.2.jar /home/minecraft/minecraft_server.jar

RUN chown -R minecraft:minecraft /home/minecraft

USER minecraft
EXPOSE 25565 25565
WORKDIR /home/minecraft
ENTRYPOINT java -Xmx1024M -Xms1024M -jar minecraft_server.jar
