Rails.application.routes.draw do

  root 'homes#top'

  get 'home/about' => 'homes#about'

  devise_for :users


  resources :users #books, only: [:new, :create, :index, :show]
  resources :books

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
