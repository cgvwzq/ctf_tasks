# Pull base image
FROM debian

# Install nginx and user
RUN \
	apt-get update && apt-get install -y wget build-essential vim curl procps && \
    wget -qO - http://nginx.org/keys/nginx_signing.key | apt-key add - && \
    echo "deb http://nginx.org/packages/debian/ stretch nginx" > /etc/apt/sources.list.d/nginx.list && \
    apt-get update && apt-get upgrade -y && \
    apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -U -m -u 1001 -s /bin/bash xss
COPY ["nginx.conf", "/etc/nginx/nginx.conf"]
COPY ["www", "/home/xss/www"]
RUN chown -R xss:xss /home/xss/

# Install Chromium
RUN \
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
	echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
	apt-get update && \
	apt-get install -y google-chrome-stable && \
	rm -rf /var/lib/apt/lists/*

# Install node
WORKDIR /home/xss/
USER xss
RUN curl -sL https://nodejs.org/dist/v8.6.0/node-v8.6.0-linux-x64.tar.xz | tar xJ 
ENV PATH $PATH:/home/xss/node-v8.6.0-linux-x64/bin
WORKDIR /home/xss/www
RUN npm install --save express body-parser cookie-parser puppeteer

# Run node service
USER root
WORKDIR /home/root/
EXPOSE 9999
COPY ["start.sh", "/home/root/start.sh"]
RUN chmod +x /home/root/start.sh
ENTRYPOINT ["./start.sh"]
