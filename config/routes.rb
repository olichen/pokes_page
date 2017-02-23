Rails.application.routes.draw do
  root 'pokes#index'

  get 'static_pages/contact'
  get 'static_pages/about'

  resources :pokes
end
