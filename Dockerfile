FROM knjcode/rpi-ruby

WORKDIR /app

RUN apt-get update && \
    apt-get install -y python-pip && \
    pip install speedtest-cli

COPY Gemfile* /app/

RUN bundle install

COPY . /app

CMD /app/bin/speedtest-to-librato
