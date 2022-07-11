FROM ruby:3.1.1
WORKDIR /opt/sha_service
CMD bundle exec rails db:migrate && bundle exec rails s
