FROM ruby:2.3-alpine

WORKDIR /app

RUN apk add --update python python-dev py-pip build-base && \
    pip install speedtest-cli && \
    rm -rf /var/cache/apk/*

COPY files /

COPY Gemfile* /app/

RUN bundle install

COPY . /app

CMD crond -f -L /dev/stdout
