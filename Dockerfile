FROM ruby:3.0.2

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle check || bundle install

COPY . ./

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]