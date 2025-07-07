FROM ubuntu:22.04

# Install system dependencies
RUN apt-get update && apt-get install -y \
    python3 python3-pip \
    nodejs npm \
    ruby ruby-dev \
    build-essential \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install Go 1.22 (update version as needed)
ENV GO_VERSION=1.22.3
RUN curl -fsSL https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz -o /tmp/go.tar.gz \
    && rm -rf /usr/local/go \
    && tar -C /usr/local -xzf /tmp/go.tar.gz \
    && rm /tmp/go.tar.gz
ENV PATH="/usr/local/go/bin:${PATH}"

# Set up working directory
WORKDIR /app

# Copy all project files
COPY . /app

# Install Python YGROORN
RUN cd /app/python && pip install .

# Install Node.js YGROORN
RUN cd /app/nodejs && npm install -g .

# Install Ruby YGROORN
RUN cd /app/ruby && gem build ygroorn.gemspec && gem install ./ygroorn-0.1.0.gem

# Build Go YGROORN CLI
RUN cd /app/go && go mod tidy
RUN cd /app/go && go build -o ygroorn ./cmd/ygroorn

# Set PATH for npm global installs and Go binaries
ENV PATH="/usr/local/go/bin:/root/go/bin:/usr/local/bin:$PATH"

# Default: open a shell for manual demo/testing
CMD ["/bin/bash"]