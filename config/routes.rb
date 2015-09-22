Rails.application.routes.draw do
  root 'boards#index'
  resources :boards
  resources :tickets do
    member do
      # put '/tickets/:id/up', to: 'tickets#up', as: 'up'
      put :up
    end
  end
end
