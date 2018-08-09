FROM centos:latest
MAINTAINER Basit Mohammad <basit.mohammad@microhealthllc.com>

RUN yum update -y
RUN yum install epel-release -y
RUN yum install git -y
RUN yum install curl -y
RUN curl -sL https://rpm.nodesource.com/setup_10.x | bash -
RUN yum install nodejs -y
RUN yum install gcc-c++ make -y
RUN git clone https://github.com/viliusle/miniPaint.git
RUN cd miniPaint
RUN npm update -y
RUN npm init -y
RUN npm install -g npm -y
RUN rm -rf /usr/local/lib/node_module
RUN rm -rf ~/.npm
RUN npm run build
