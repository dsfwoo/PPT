Rails.application.routes.draw do
  # resources :boards do
  #   resources :posts, only: [:index, :new, :create]
  # end
  # resources :posts, except: [:index, :new, :create]

  resources :boards do
    resources :posts, shallow: true
  end
  
  root "boards#index"
  get "/about", to: "pages#about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
