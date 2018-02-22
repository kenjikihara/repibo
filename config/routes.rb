Rails.application.routes.draw do
  root 'homes#index'
  resources :messages, only: [:new, :create, :show]
  resources :contacts, only: [:new, :create,]
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
end
