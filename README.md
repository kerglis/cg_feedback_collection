# README

## Bootstrap the project

    $ git clone git@github.com:kerglis/cg_feedback_collection.git
    $ cd cg_feedback_collection
    $ bundle install
    $ rake db:setup
    $ rails s

## RSpec tests

    $ rspec spec

## API

### List feedbacks

    GET /api/v1/feedback/list

    `limit` (Integer) - to change default limit of 20
    `filter` (String) - `successful` or `unsuccessful` to filter out respective feedbacks