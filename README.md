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

**Options**

* `limit` -- change the default limit `GET /api/v1/feedback/list?limit=10`
* `filter` --  filter out respective feedbacks `successful` | `unsuccessful` -- `GET /api/v1/feedback/list?filter=unsuccessful&limit=100`