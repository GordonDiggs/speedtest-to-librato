FROM knjcode/rpi-ruby

WORKDIR /app

COPY Gemfile* /app/

RUN bundle install

COPY . /app

CMD /app/bin/speedtest-to-librato
