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
    - name: GitHub Action for Slack
      env:
        SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK }}
      uses: Ilshidur/action-slack@1.6.2
      with: 
        args: 'A new workflow has happened'
    - name: Notify slack
      env:
        SLACK_BOT_TOKEN: ${{ secrets.SLACK_BOT_TOKEN }}
      uses: pullreminders/slack-action@master
      with:
        args: '{\"channel\":\"CSGSHM3N2\",\"text\":\"Hello world\"}'
    - name: Set up Ruby 2.6
      uses: actions/setup-ruby@v1
      with:
        ruby-version: 2.6.5
    - name: Build and test with Rake
      run: |
        gem install bundler
        bundle install --jobs 4 --retry 3
        bundle exec rake```