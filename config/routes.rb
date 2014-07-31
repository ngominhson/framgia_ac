Rails.application.routes.draw do
  resources :users
  get "static_pages/home"
end
