Rails.application.routes.draw do
  get 'tops/index'
  root 'tops#index'
  get 'rooms/search'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :rooms do
    resources :reservations
  end
 
  post 'reservation/confirm' => 'reservations#confirm'
  post 'rooms/:room_id/reservations' => 'reservations#create'
  get 'rooms/:room_id/reservations/:id/edit' => 'reservations#edit'
  get 'users/mypage' => 'users#mypage'
  delete 'rooms' => 'rooms#destroy'
  resources :users
  resources :reservations
  resources :rooms
end
