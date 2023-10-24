FROM ruby
WORKDIR /opt/shaservice
ENTRYPOINT ["/bin/bash", "-c"]
CMD ["bundle exec rails db:migrate; bundle exec rails s -b 0.0.0.0"]
