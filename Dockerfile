FROM ruby:3.3-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /site

# Copy Gemfile first for layer caching
COPY Gemfile* ./

# Install gems
RUN gem install bundler && bundle install

# Copy the rest of the site
COPY . .

EXPOSE 4000

CMD ["bundle", "exec", "jekyll", "serve", \
     "--host", "0.0.0.0", \
     "--livereload", \
     "--force_polling"]