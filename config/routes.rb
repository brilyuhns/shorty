Rails.application.routes.draw do
  resources :short_urls
  root to: 'visitors#index'
end
