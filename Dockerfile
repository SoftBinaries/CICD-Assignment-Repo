FROM ubuntu
RUN apt-get update && upgrade -y
RUN apt-get install -y nginx
CMD ["echo","Image created !!!"]