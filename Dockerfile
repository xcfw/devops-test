FROM ruby
WORKDIR /opt/sha-service
CMD bundle exec rails db:migrate && bundle exec rails s
