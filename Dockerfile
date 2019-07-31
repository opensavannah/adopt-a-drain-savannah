FROM ruby:2.4.5
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  libgmp3-dev \
  postgresql-client-9.6
RUN mkdir /myapp
WORKDIR /myapp
EXPOSE 3000
COPY . /myapp
RUN bundle install
RUN RAILS_ENV=production bundle exec rake assets:precompile
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
