Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :three_phrases, except: [:edit, :update]
  resources :four_phrases,  except: [:edit, :update]

  namespace :admin do
    get    'login'  => 'sessions#new'
    post   'login'  => 'sessions#create'
    delete 'logout' => 'sessions#destroy'

    get 'dashboard' => 'dashboard#index'

    resource :admin, only: [:edit, :update]

    resources :three_phrases, only: [:index, :edit, :update, :destroy]
    resources :four_phrases, only: [:index, :edit, :update, :destroy]
  end
  get '/admin' => redirect('/admin/dashboard')
end
