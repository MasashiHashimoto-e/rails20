Rails.application.routes.draw do
  get 'users/index'
  get 'tops/index'
  root 'tops#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  get 'users/mypage' => 'users#mypage'
  resources :users
end
