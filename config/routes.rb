Rails.application.routes.draw do
  root to: 'three_phrases#index'

  resources :three_phrases, except: [:edit, :update]
end
