Rails.application.routes.draw do
  root to: 'pages#home'
  resources :sellers do
    resources :appointments
  end

  resources :realtors do
    resources :appointments do
      get 'past', on: :collection
      get 'future', on: :collection
    end
  end
end
