Rails.application.routes.draw do
  root 'boards#index'
  resources :boards
  resources :tickets do
    member do
      put :down
      put :up
    end
  end
end
