# Pull base image
FROM debian

# Install nginx and create user
USER root
RUN apt-get update
RUN apt-get -y install curl gnupg build-essential vim wget mariadb-server chromium ca-certificates
RUN curl -sL https://deb.nodesource.com/setup_11.x  | bash -
RUN apt-get -y install nodejs
RUN useradd -U -m -u 1001 -s /bin/bash xss
COPY ["www", "/home/xss/www"]
RUN chown -R xss:xss /home/xss/

# Install node
WORKDIR /home/xss/www/
USER xss
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
RUN npm install # install node dependencies

# Run node service
USER root
WORKDIR /home/root/
EXPOSE 80
COPY ["start.sh", "/home/root/start.sh"]
RUN chmod +x /home/root/start.sh
ENTRYPOINT ["./start.sh"]
