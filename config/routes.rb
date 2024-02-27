Rails.application.routes.draw do
  get 'rooms/index'
  get 'reservations/index'
  get 'users/index'
  get 'tops/index'
  root 'tops#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  get 'users/mypage' => 'users#mypage'
  resources :users
  resources :reservations
  resources :rooms
end
