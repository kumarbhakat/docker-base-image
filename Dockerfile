# Use lightweight nginx base image
FROM nginx:1.27.3

# Install AWS CLI and tar without pip (use Alpine package manager)
RUN apt-get update -y
RUN apt-get install curl awscli net-tool telnet dnsutils vim -y
RUN aws configure set default.s3.signature_version s3v4
