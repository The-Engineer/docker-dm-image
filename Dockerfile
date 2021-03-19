FROM ubuntu:18.04
LABEL maintainer="Felix Barsnick"
LABEL version="1.0"

# Install required packages for next installs
RUN apt-get update && apt-get install -y wget curl

# Install Java JDK 8
RUN apt install openjdk-8-jdk -y

# Install Maven 3.6
# RUN apt install maven -y # instaliert leider nur 3.6.0
RUN wget https://downloads.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz -P /tmp
RUN tar xf /tmp/apache-maven-3.6.3-bin.tar.gz -C /opt
RUN ln -s /opt/apache-maven-3.6.3 /opt/maven

ENV M2_HOME=/opt/apache-maven-3.6.3
ENV MAVEN_HOME=/opt/apache-maven-3.6.3
ENV PATH=${M2_HOME}/bin:${PATH}

# Install NodeJS
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs

# Update npm to latest version
#RUN npm install npm@latest -g

# Update npm
RUN npm update -g npm

# Install neccessary modules
#RUN npm install -g grunt@1.0.4
RUN npm install -g grunt-cli@1.2.0
#RUN npm install -g grunt@1.0.4
RUN npm install -g yarn

# Install Ansible
RUN apt install ansible -y

# Run cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Run command line
CMD /bin/bash
