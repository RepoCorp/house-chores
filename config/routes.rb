Rails.application.routes.draw do
  root 'calendar#show'

  get 'calendar/show'

  resources :executed_chores
  resources :scheduled_chores
  resources :chores
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
