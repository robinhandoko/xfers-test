Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "users#index"

  resources :users do
    collection do
      get 'shop'
    end

    member do
      get 'buy'
      get 'complete'
    end
  end
end
