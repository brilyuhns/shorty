Rails.application.routes.draw do
  resources :short_urls, param: :code do   
    get :info, on: :member
  end
  root to: 'short_urls#new'
end
