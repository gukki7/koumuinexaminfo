Rails.application.routes.draw do
  devise_for :admins, :skip => [:registrations, :password],controllers: {
    sessions: 'admins/sessions',
  }
  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }

  namespace :admins do
    resources :exams, only: [:index, :new, :create, :show, :edit, :update]
    resources :subjects, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :tweets, only: [:index, :show, :destroy] do
      resources :tweet_comments, only: [:destroy]
    end
  end

  namespace :customers do
    # root to: 'homes#top'
    post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
    get 'customers/my_page' => 'customers#show'
    get 'customers/infomation/edit' => 'customers#edit'
    patch 'customers/infomation' => 'customers#update'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'
    resources :exams, only: [:index, :show,]
    resources :subjects, only: [:index, :show,]
    resources :tweets, only: [:index, :new, :create, :show,  :edit, :destroy, :update] do
      resource :favorites, only: [:create, :destroy]
      resource :bookmarks, only: [:create, :destroy]
      get :search, on: :collection
      resources :tweet_comments, only: [:create, :destroy]
    end
    resources :tags, only: [:show]
  end


  namespace :tweets do
    resources :searches, only: :index
  end

  root to: 'customers/homes#top', as: 'customers_root'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
