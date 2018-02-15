Rails.application.routes.draw do
  root 'homes#index'
  resources :messages
  resources :contacts, only: [:new, :create]
  resources :comments
  resources :users
  resources :sessions, only: [:new, :create, :destroy, :edit]
  resources :donations, only: [:index]
  resources :disclaimers, only: [:index]
  get 'tags/:tag', to: 'books#index', as: :tag
  resources :books do
    collection do
      post :confirm
    end
  end
    
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
