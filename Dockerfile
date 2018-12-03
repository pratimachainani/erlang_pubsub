# Build stage 0
FROM erlang:20-alpine

# Install Rebar3
RUN mkdir -p /buildroot/rebar3/bin
ADD https://s3.amazonaws.com/rebar3/rebar3 /buildroot/rebar3/bin/rebar3
RUN chmod a+x /buildroot/rebar3/bin/rebar3

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

# Setup Environment
ENV PATH=/buildroot/rebar3/bin:$PATH

# Reset working directory
WORKDIR /buildroot

COPY erl_rest_chat erl_rest_chat

WORKDIR /buildroot/erl_rest_chat
RUN chmod a+x run
CMD ["sh", "run"]
#CMD ["cd erl_rest_chat && ./run"]

