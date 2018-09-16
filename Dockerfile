FROM ruby:2.2.9
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /hartl_rails_4_2_sample_app
WORKDIR /hartl_rails_4_2_sample_app
COPY Gemfile /hartl_rails_4_2_sample_app/Gemfile
COPY Gemfile.lock /hartl_rails_4_2_sample_app/Gemfile.lock
RUN bundle install
COPY . /hartl_rails_4_2_sample_app
