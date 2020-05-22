FROM amazonlinux:2018.03
LABEL maintainer="Michael Hausenblas, hausenbl@amazon.com"

# install eksctl, IAM authenticator, kubectl, and jq:
RUN yum -y install shadow-utils && \
    curl https://amazon-eks.s3.us-west-2.amazonaws.com/1.16.8/2020-04-16/bin/linux/amd64/aws-iam-authenticator -o aws-iam-authenticator  && \
    chmod +x ./aws-iam-authenticator && \
    mv ./aws-iam-authenticator /usr/local/bin && \
    curl --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp && \
    mv /tmp/eksctl /usr/local/bin && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin  && \
    JQ=/usr/bin/jq && \
    curl https://stedolan.github.io/jq/download/linux64/jq > $JQ && chmod +x $JQ

# copy from repo into container image:
COPY entrypoint.sh /entrypoint.sh

# make default on start-up:
ENTRYPOINT ["/entrypoint.sh"]
