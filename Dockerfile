FROM ruby:2.6.4-alpine3.10@sha256:f3eeb2b71ae7c004ca57ddb12618fde07dece33e6a0f0a50b53f03b83be76174

RUN apk add --no-cache --update \
    git \
    nodejs \
    postgresql-client \
    tzdata \
    yarn \
    && apk add --no-cache --virtual .build-deps \
      build-base \
      postgresql-dev \
      sqlite-dev

ENV CI=true
ENV SHIPIT_VERSION=v0.28.1

RUN gem install rails -v 5.2 --no-document

WORKDIR /usr/src/

WORKDIR /usr/src/shipit

COPY . .

RUN mv ./config/credentials-prod.yml.enc ./config/credentials.yml.enc

RUN gem install bundler:2.1.4
RUN bundle install

RUN apk del .build-deps

EXPOSE 3000

CMD rails server -b 0.0.0.0 && bundle exec sidekiq -C config/sidekiq.yml