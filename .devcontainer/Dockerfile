# Make sure RUBY_VERSION matches the Ruby version in .ruby-version
ARG RUBY_VERSION=3.4.2
FROM ghcr.io/rails/devcontainer/images/ruby:$RUBY_VERSION

# Install Python
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends python3 python3-pip python3-venv \
    && apt-get clean && rm -rf /var/lib/apt/lists/*
