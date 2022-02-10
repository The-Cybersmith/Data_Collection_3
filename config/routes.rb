Rails.application.routes.draw do
  # This is what will allow new threats to be logged.
  get 'report', to: 'threat#create'
  # This is what will allow existing threats to be seen.
  get 'threats', to: 'threat#show'
  # This is part of the logging process.
  post 'progress', to: 'threat#progress'
  # First, the index page, which is where the user will arrive by default (by visiting "http://localhost:3000/")
  get 'home/index', to: 'home#index'
  root to: 'home#index'
end


