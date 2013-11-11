FROM zachlatta/jvm
MAINTAINER Zach Latta <zach@zachlatta.com>

RUN useradd -s /bin/bash -d /minecraft -m minecraft
ADD https://s3.amazonaws.com/Minecraft.Download/versions/1.7.2/minecraft_server.1.7.2.jar /minecraft/minecraft_server.jar
RUN chown -R minecraft:minecraft /minecraft

VOLUME /minecraft
WORKDIR /minecraft
USER minecraft
EXPOSE 25565

ENTRYPOINT java -Xmx1024M -Xms1024M -jar minecraft_server.jar
