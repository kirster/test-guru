Rails.application.routes.draw do

  root to: 'tests#index'

  devise_for :users, path: :gurus, path_name: { sign_in: :login, sign_out: :logout },
              controllers: { sessions: 'users/sessions' }

  get '/users/:id/badges', to: 'users#badges', as: 'user_badges'

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: [:show, :update] do
    member do
      get :result
      post :gist
    end
  end

  resources :feedback_messages, only: :create
  get 'feedback', to: "feedback_messages#new"

  resources :badges, only: :index

  namespace :admin do

    resources :gists, shallow: true, only: :index

    resources :badges, shallow: true, except: :index

    resources :tests do
      patch :update_inline, on: :member
       
      resources :questions, shallow: true do 
        resources :answers, shallow: true, except: :index
      end
    end
  end

end
