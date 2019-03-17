Rails.application.routes.draw do
  devise_for :users
  root 'static_page#home'
  get 'static_page/home'
  get '/readings/doya'
  resources :readings, except: :show
  get 'rakuten/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
