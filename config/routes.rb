Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

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
    get 'three_phrases/download'
    resources :four_phrases, only: [:index, :edit, :update, :destroy]
    get 'four_phrases/download'
  end
  get '/admin' => redirect('/admin/dashboard')
end
