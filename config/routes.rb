Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'hello', to: 'hello#hello'
  get 'persons/main', as: 'user_root'

  resource :payments

  root 'application#index'
end
