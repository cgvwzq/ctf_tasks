FROM debian
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
    build-essential curl python && \
    useradd -N -m -u 1001 -s /bin/bash foo 

WORKDIR /home/foo/
RUN curl -sL https://nodejs.org/dist/v8.5.0/node-v8.5.0-linux-x64.tar.xz | tar xJ 
COPY ["www", "/home/foo/www"]
RUN chown -R foo:users .

WORKDIR /home/foo/www/
USER foo
ENV PATH $PATH:/home/foo/node-v8.5.0-linux-x64/bin
RUN npm install 

WORKDIR /home/foo/www/
EXPOSE 3000
CMD ["bash", "run.sh"]
