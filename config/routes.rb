Rails.application.routes.draw do
  resources :puckhead_game_players
  resources :puckhead_games, only: [:index, :show, :create]
  resources :players, only: [:index, :show, :update]
  resources :users, only: [:index, :show, :create, :update, :destroy]

  post "login", to: "authentication#login"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
