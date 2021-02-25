FROM ubuntu:18.04
LABEL maintainer="Felix Barsnick"
LABEL version="1.0"

# Install required packages for next installs
RUN apt-get update && apt-get install -y wget curl

# Install Java JDK 8
RUN apt install openjdk-8-jdk -y

# Install Maven 3.6
RUN apt install maven -y

# Install NodeJS
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs

# Update npm to latest version
RUN npm install npm@latest -g

# Update npm
RUN npm update -g npm

# Install neccessary modules
#RUN npm install -g grunt@1.0.4
RUN npm install -g grunt-cli@1.2.0

# Run cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Run command line
CMD /bin/bash
