Rails.application.routes.draw do
  get 'static_pages/contact'

  get 'static_pages/about'

  resources :pokes
  root 'pokes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
