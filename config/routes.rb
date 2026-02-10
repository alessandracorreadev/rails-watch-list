Rails.application.routes.draw do
  get 'lists/index'
  get 'lists/show'
  get 'lists/new'
  get 'lists/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root "lists#index"

  # GET /lists → lists#index

  # GET /lists/:id → lists#show

  # GET /lists/new → lists#new

  # POST /lists → lists#create

  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: :create
  end

  resources :bookmarks, only: :destroy

end
