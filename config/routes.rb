Rails.application.routes.draw do
  get 'reviews/new'

  get 'reviews/create'

  get 'restaurants/index'

  get 'restaurants/new'

  get 'restaurants/create'

  get 'restaurants/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :restaurants, only: [:index, :new, :create, :show]  do
    resources :reviews, only: [:new, :create]
  end

end
