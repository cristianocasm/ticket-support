Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "sessions" }

  resources :tickets, except: [:show, :destroy] do
    resources :messages, only: [:index, :create]
  end
end
