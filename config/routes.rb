Rails.application.routes.draw do
  resources :short_urls do   
    get :info, on: :member
  end
  root to: 'visitors#index'
end
