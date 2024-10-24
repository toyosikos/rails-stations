# Rails.application.routes.draw do
#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

#   # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
#   # Can be used by load balancers and uptime monitors to verify that the app is live.
#   get "up" => "rails/health#show", as: :rails_health_check
    
#   # Define routes for movies (public access)
#   resources :movies, only: %i[index show] 
#   # Define routes for schedules
#   resources :schedules, only: [:show] # 追加: スケジュールのshowアクションに対応
#   resources :sheets
#   # Admin namespace routes
#   namespace :admin do
#     resources :movies, only: [:index, :new, :create, :edit, :update, :show, :destroy] do
#       resources :schedules, only: [:index, :show, :new, :create, :edit, :update, :destroy] # schedules をネスト
#     end
#     root to: redirect('/admin/movies') # /admin へのアクセスを /admin/movies にリダイレクト
#   end
  

#   # Define the root path route ("/")
#   root "movies#index"
# end

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "up" => "rails/health#show", as: :rails_health_check

  post 'reservations' => 'reservations#create'
  resources :sheets
  
  resources :movies, only: %i[index show] do
    resources :schedules do
      resources :reservations
    end
    get 'reservation' => 'movies#reservation'
  end
  
  namespace :admin do
    resources :theaters, only: %i[new create]
    resources :screens, only: %i[new create]
    resources :reservations
    resources :movies do
      resources :schedules, only: %i[new create] # スケジュールをネスト
    end
    

    # Admin直下でのスケジュールアクセスを追加
    resources :schedules, except: %i[new create]

    root to: redirect('/admin/movies')
  end

  root "movies#index"
end
