Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "users#index"

  resources :users do
    collection do
      get 'shop'
      get 'complete'
    end

    member do
      get 'buy'
    end
  end
end
