Rails.application.routes.draw do
  get 'welcome/index'

  root to: 'three_phrases#index'

  resources :three_phrases, except: [:edit, :update]
  resources :four_phrases,  except: [:edit, :update]
end
