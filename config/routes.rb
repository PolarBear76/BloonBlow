Rails.application.routes.draw do
  devise_for :users

  # match "/pins/add_new_comment" => "pin#add_new_comment", :as => "add_new_comment_to_pins", :via => [:pin]
resources :users do
    member do
      get :follow
      get :unfollow
    end
  end

  resources :pins do
  member do
    put "like", to: "pins#upvote"
    put "dislike", to: "pins#downvote"
  end
end

resources :tags, only: [:index, :show]
  
  
  get 'profile' => 'pages#profile'
  get 'pages/home'
  get "first" => "pages#first"
  get 'about' => 'pages#about'
  get 'bg' => 'images#bg'
 
  root 'pins#index'
end
