Rails.application.routes.draw do

  mount API => '/'

  resources :feedbacks

  root to: 'feedbacks#new'

end