Rails.application.routes.draw do
  get 'tops/index'
  root 'tops#index'
  get 'rooms/search'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
 
  get 'users/mypage' => 'users#mypage'
  delete 'rooms' => 'rooms#destroy'
  resources :users
  resources :reservations
  resources :rooms
end
