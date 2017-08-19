FROM ruby:2.3-slim

RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential nodejs libpq-dev nodejs-legacy libfontconfig1-dev npm
RUN npm install -g phantomjs

ENV INSTALL_PATH /simple_slack_chat

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile ./

ENV BUNDLE_PATH /box

COPY . .
