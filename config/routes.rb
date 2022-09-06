Rails.application.routes.draw do

  root 'homes#top'
  resource :user, only: [:new, :create, :show]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#delete'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
