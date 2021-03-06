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

* `limit` -- change the limit (default = 20)

  `GET /api/v1/feedback/list?limit=10`
* `filter` --  filter out respective feedbacks `successful` or `unsuccessful`

  `GET /api/v1/feedback/list?filter=unsuccessful&limit=100`

### Post feedback

    POST /api/v1/feedback

**Parameters**

    params do
      requires :is_success,         type: Boolean
      requires :feedback,           type: String
      optional :name,               type: String
      optional :email,              type: String
      optional :restored_at,        type: Date
      optional :image,              type: String
      optional :website_url,        type: String
    end

### Administration
  To enter the `/admin` pages you must first authenticate. Set the desired username and password using environment variables.

  ```
  export cg_feedback_app_admin_user=my_admin_username
  export cg_feedback_app_admin_password=my_password
  ```
