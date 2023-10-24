FROM ruby:3.1.1-slim-bullseye
WORKDIR /opt/shaservice

COPY Gemfi* .
RUN  buildDeps='build-essential default-libmysqlclient-dev' \
     && apt-get -qq update \
     && apt-get -qq -y install $buildDeps curl ruby-mysql2 --fix-missing --no-install-recommends \
     && bundle install \
     && apt-get purge -y --auto-remove $buildDeps \
     && rm -rf /var/lib/apt/lists/* \
     && find /usr/local/bundle/gems/ -name "*.c" -delete \
     && find /usr/local/bundle/gems/ -name "*.o" -delete

ENTRYPOINT ["/bin/bash", "-c"]
CMD ["bundle exec rails db:migrate; bundle exec rails s -b 0.0.0.0"]
