FROM python:3.8

# Install AWS Tools
RUN apt-get update \
	&& apt-get install -y -qq jq gettext-base \
	&& apt-get clean \
	&& pip install awscli \
    && pip install awsebcli --upgrade \
    && curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest \
    && chmod +x /usr/local/bin/ecs-cli

# Configure the local bins
ENV PATH="/root/.local/bin:${PATH}"

# Install Docker
RUN curl -sSL https://get.docker.com/ | sh

# Install npm
RUN curl -sL https://deb.nodesource.com/setup_12.x | sh \
    && apt-get install -y -qq nodejs
