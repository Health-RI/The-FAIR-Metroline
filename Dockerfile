FROM ruby:3.3

WORKDIR /site

# Install dependencies
COPY Gemfile* ./
RUN bundle install

# Expose port 4000
EXPOSE 4000

# Run Jekyll with live reload
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--livereload", "--force_polling"]
