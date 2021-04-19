Rails.application.routes.draw do

  require 'sidekiq/web'

  Rails.application.routes.draw do
    mount Sidekiq::Web => '/sidekiq'
  end

  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"
  resources :products
  get 'search', to: "products#search", as: :search
  post 'import_data', to: "products#import_data", as: :import_data
  
end
