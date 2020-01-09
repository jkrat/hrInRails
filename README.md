# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

```
name: Ruby

on: [push]

jobs:
  build:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v1
    - uses: actions/cache@preview
      id: cache
      with:
        path: ~/local/rubies
        key: ruby-2.6.5
    - uses: clupprich/ruby-build-action@master
      id: ruby
      with:
        ruby-version: 2.6.5
        cache-available: ${{ steps.cache.outputs.cache-hit == 'true' }}
    - name: Print version
      run: ${{ steps.ruby.outputs.ruby-path }} --version
    - name: Build and test with Rake
      run: |
        gem install bundler
        bundle install --jobs 4 --retry 3
        bundle exec rake
        ```
