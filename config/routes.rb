Rails.application.routes.draw do
  resources :pokes
  root 'pokes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
