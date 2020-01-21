Rails.application.routes.draw do
  resources :puckhead_game_players
  resources :puckhead_games, only: [:index, :show, :create]
  resources :players, only: [:index, :show]
  resources :users, only: [:create, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
