# Bamboo Server
#
# VERSION               0.0.1

FROM phusion/baseimage:0.9.16
MAINTAINER Mohammad Naghavi "mohamnag@gmail.com"

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Environment
ENV BAMBOO_VERSION 5.8.1
ENV BAMBOO_HOME /home/bamboo

# Expose web and agent ports
EXPOSE 8085
EXPOSE 54663

# Add runit service
ADD bamboo-server.sh /etc/service/bamboo-server/run
ADD docker-cc.sh /bin
RUN chmod +x /bin/docker-cc.sh

# Make sure we get latet packages
RUN apt-get update && apt-get upgrade -y # 28.01.2015

# Install Java OpenJDK 7, 8 and VCS tools
RUN apt-get install -yq python-software-properties && add-apt-repository ppa:webupd8team/java -y && apt-get update
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -yq oracle-java7-installer git subversion oracle-java8-installer

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
