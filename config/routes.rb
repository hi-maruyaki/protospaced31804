Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'prototypes/index'
  root to: 'prototypes#index'
  resources :prototypes, only: [:index, :new, :create, :post, :destroy, :edit, :show, :update]

  resources :prototypes do
    resources :comments, only:  [:create, :destroy, :show]
  end

  resources :users, only: :show

end


