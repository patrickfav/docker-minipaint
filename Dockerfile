FROM centos:latest
RUN yum update -y
RUN yum install epel-release -y
RUN yum install git -y
RUN yum install curl -y
RUN curl -sL https://rpm.nodesource.com/setup_10.x | bash -
RUN yum install nodejs -y
RUN npm install -g npm -y
WORKDIR /var
RUN git clone https://github.com/viliusle/miniPaint.git
WORKDIR /var/miniPaint
RUN npm update -y
RUN npm init -y
CMD bash -c "node_modules/.bin/webpack-dev-server --public 0.0.0.0:8080 "
