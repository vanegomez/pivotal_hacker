Rails.application.routes.draw do
  root 'boards#index'
  resources :boards
  resources :tickets do
    member do
      put :status
    end
  end
end

