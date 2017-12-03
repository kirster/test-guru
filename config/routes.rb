Rails.application.routes.draw do

  root to: 'tests#index'

  resources :sessions, only: :create
  get :login,   to: 'sessions#new'
  get :logout,  to: 'sessions#destroy'

  resources :users, only: :create
  get :signup, to: 'users#new'

  resources :tests do
    resources :questions, shallow: true do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
    
  end

  resources :test_passages, only: [:show, :update] do
    member do
      get :result
    end
  end

end
