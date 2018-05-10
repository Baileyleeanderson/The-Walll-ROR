Rails.application.routes.draw do
  resources :users
  resources :messages
  get 'logout' => 'users#logout'

end
