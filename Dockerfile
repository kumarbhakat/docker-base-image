# Use Debian-based nginx image
FROM nginx:stable

# Install dependencies
RUN apt-get update -y && apt-get install -y \
    curl \
    awscli \
    net-tools \
    telnet \
    dnsutils \
    vim \
 && rm -rf /var/lib/apt/lists/*
