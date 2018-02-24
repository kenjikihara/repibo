Rails.application.routes.draw do
  root 'homes#index'
  resources :books do
    collection do
      post :confirm
    end
  end
  resources :contacts, only: [:new, :create,]
  resources :disclaimers, only: [:index]
  resources :donations, only: [:index]
  resources :messages, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy, :edit]
  resources :users
  get 'tags/:tag', to: 'books#index', as: :tag
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
