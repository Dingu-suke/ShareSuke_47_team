FROM ruby:3.2.3

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq \
  && apt-get install -y build-essential nodejs yarn libvips

WORKDIR /app
COPY Gemfile* /app/
RUN bundle config --local set path 'vendor/bundle' \
  && bundle install

ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
ENV NODE_VERSION=19
RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - \