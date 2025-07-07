FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    python3 python3-pip \
    nodejs npm \
    ruby ruby-dev \
    build-essential \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

ENV GO_VERSION=1.22.3
RUN curl -fsSL https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz -o /tmp/go.tar.gz \
    && rm -rf /usr/local/go \
    && tar -C /usr/local -xzf /tmp/go.tar.gz \
    && rm /tmp/go.tar.gz
ENV PATH="/usr/local/go/bin:${PATH}"

WORKDIR /app
COPY . /app
RUN cd /app/python && pip install .
RUN cd /app/nodejs && npm install -g .
RUN cd /app/ruby && gem build ygroorn.gemspec && gem install ./ygroorn-0.1.0.gem
RUN cd /app/go && go mod tidy
RUN cd /app/go && go build -o ygroorn ./cmd/ygroorn
ENV PATH="/usr/local/go/bin:/root/go/bin:/usr/local/bin:$PATH"

CMD ["/bin/bash"]