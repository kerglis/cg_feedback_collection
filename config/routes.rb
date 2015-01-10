Rails.application.routes.draw do

  mount API => '/'

  namespace :admin do
    resources :feedbacks do
      get :swap, on: :member
    end

    root to: 'feedbacks#index'
  end

  resources :feedbacks

  root to: 'feedbacks#new'

end