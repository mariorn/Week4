Rails.application.routes.draw do

  get '/' => 'site#home'

  resources :users do
    resources :products
  end

  resources :users do
      resources :bids
  end

  resources :products do
      resources :bids
  end



end


