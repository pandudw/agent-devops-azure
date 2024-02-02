FROM python:3.10

RUN apt update \
    && apt upgrade -y \
    && apt install -y curl git jq libicu-dev sudo

ENV TARGETARCH="linux-x64"

WORKDIR /azp/

COPY ./start.sh ./
RUN chmod +x ./start.sh

RUN useradd agent
RUN chown agent ./
RUN echo "agent ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER agent

# Another option is to run the agent as root.
# ENV AGENT_ALLOW_RUNASROOT="true"

ENTRYPOINT ./start.sh