Rails.application.routes.draw do
  resources :short_urls, param: :code do   
    get :info, on: :member
  end
  get '/:code', to: 'short_urls#show', as: :short
  root to: 'short_urls#new'
end
