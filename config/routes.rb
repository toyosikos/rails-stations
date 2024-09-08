Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Define routes for movies (public access)
  resources :movies, only: %i[index show] 

  # Admin namespace routes
  namespace :admin do
    resources :movies, only: [:index, :new, :create,:edit,:update,:show,:destroy] # admin/movies に関するルートを定義
    root to: redirect('/admin/movies') # /admin へのアクセスを /admin/movies にリダイレクト
  end

  # Define the root path route ("/")
  root "movies#index"
end
