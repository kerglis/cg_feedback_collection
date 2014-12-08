Rails.application.routes.draw do

  resources :feedbacks, except: [ :index, :destroy ]

  root to: 'feedbacks#new'

end