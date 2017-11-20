Rails.application.routes.draw do
  resources :tests do
    resources :questions, shallow: true
  end

  get '/tests/:test_id/questions/:id', to: 'questions#show'
end
