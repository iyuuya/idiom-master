Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :three_phrases, except: [:edit, :update]
  resources :four_phrases,  except: [:edit, :update]
end
