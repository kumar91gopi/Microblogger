Rails.application.routes.draw do
  
 
   root             'static_pages#home'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup'  => 'users#new'
  get 'login'   => 'sessions#new'
  post 'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'password_reset/new'
  get 'password_reset/edit'
  
  get 'sessions/new'
  get 'users/new'
  
   resources :users do
    member do
      get :following, :followers
    end
  end


  resources :account_activations, only: [:edit]
  resources :users
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]


  

 
end