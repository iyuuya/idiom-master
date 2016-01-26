Rails.application.routes.draw do
  resources :four_phrases
  root to: 'three_phrases#index'

  resources :three_phrases, except: [:edit, :update]
end
