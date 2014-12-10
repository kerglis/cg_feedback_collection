class API < Grape::API

  ENDPOINTS = [ FeedbackAPI ]

  prefix 'api'
  format :json
  version 'v1', using: :path

  mount FeedbackAPI => ''

end