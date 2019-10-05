# Pull base image
FROM debian

# Install nginx and create user
USER root
RUN apt-get update
RUN apt-get -y install curl gnupg build-essential vim wget
RUN curl -sL https://deb.nodesource.com/setup_11.x  | bash -
RUN apt-get -y install nodejs
RUN useradd -U -m -u 1001 -s /bin/bash mojo
COPY ["ws", "/home/mojo/ws"]
RUN chown -R mojo:mojo /home/mojo/

# Install node
WORKDIR /home/mojo/ws/
USER mojo
RUN npm install # install node dependencies

# Run node service
USER root
WORKDIR /home/root/
EXPOSE 80
COPY ["start.sh", "/home/root/start.sh"]
RUN chmod +x /home/root/start.sh
ENTRYPOINT ["./start.sh"]
