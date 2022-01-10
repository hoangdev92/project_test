Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  resources :projects
  resources :departments do
    member do
      get :groups
    end
  end
  resources :groups
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
