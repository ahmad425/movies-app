# Use an official Ruby runtime as a parent image
FROM ruby:2.4.10-alpine

# Install dependencies for nokogiri
RUN apk update && apk add --no-cache build-base libxml2-dev libxslt-dev zlib-dev curl-dev openssl-dev

# Install dependencies for PostgreSQL and build tools
RUN apk update && apk add --no-cache postgresql-dev

# Set the working directory in the container
WORKDIR /movie-app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

RUN gem install bundler:$(cat Gemfile.lock | tail -1 | tr -d " ")

# Install dependencies
RUN bundle install

# Copy the rest of the application code into the container
COPY . .

# Expose port 3000 (or whatever port your Ruby app runs on)
EXPOSE 3000
