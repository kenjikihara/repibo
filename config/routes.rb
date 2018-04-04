Rails.application.routes.draw do

  # scope "(:locale)" do
  root 'homes#index'
  scope "/:locale" do
    resources :books do
      collection do
        post :confirm
      end
    end
    resources :contacts, only: [:new, :create,]
    resources :disclaimers, only: [:index]
    resources :donations, only: [:index]
    resources :messages, only: [:new, :create, :show]
    resources :messages do
      collection do
        post :confirm
      end
    end
    resources :sessions, only: [:new, :create, :destroy, :edit]
    resources :users
    
    get 'tags/:tag', to: 'books#index', as: :tag
  end
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end