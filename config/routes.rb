Rails.application.routes.draw do
  root to: 'pages#home'
  resources :sellers do
    resources :appointments
  end
end
