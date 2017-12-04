Rails.application.routes.draw do
  devise_for :users
  root 'calendar#show'

  get 'calendar/show'
  post 'calendar/update'

  resources :executed_chores
  resources :scheduled_chores
  resources :chores
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
