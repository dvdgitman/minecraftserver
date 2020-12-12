FROM ubuntu:latest

RUN apt-get update -y

RUN apt install python3-pip -y

RUN pip3 install requests

RUN apt-get update && DEBIAN_FRONTEND="noninteractive" TZ="America/New_York" apt-get install -y tzdata

RUN apt -y install default-jre

RUN apt-get -y install wget

WORKDIR /mcserver

RUN wget https://launcher.mojang.com/v1/objects/35139deedbd5182953cf1caa23835da59ca3d7cd/server.jar

RUN echo "eula=true" > eula.txt

CMD java -Xmx8096M -Xms8096M -jar server.jar

EXPOSE 25565



