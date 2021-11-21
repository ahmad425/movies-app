Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :movies, only: %i[index show] do 
      member do
        post :make_favourite
      end
    end
    resources :users, only: %i[create] do 
      member do
        get :favourite_movies
      end
    end
  end
end
