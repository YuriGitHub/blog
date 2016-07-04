Rails.application.routes.draw do

  get 'sessions/new' => 'sessions#new'
  post 'sessions/' => 'sessions#create'
  delete 'sessions/destroy' => 'sessions#destroy'
  get 'registration/' => 'registrations#new'
  post 'registration' => 'registrations#create'
  get 'registration/edit/user' => 'registrations#edit'
  patch 'registration/edit/user' => 'registrations#update'
  resources :posts do resource :comments
  end
  delete 'comments/:comment_id', to: 'comments#delete_current_comment', as: 'comment'

  patch 'comments/:comment_id' => 'comments#update_current'

  get 'comments/:comment_id/edit',to: 'comments#show_current', as: 'comments'

  get 'user/' => 'registrations#stat'

end
