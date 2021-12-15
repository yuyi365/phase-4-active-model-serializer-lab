Rails.application.routes.draw do
  resources :tags, only: %i[index show]
  resources :posts, only: %i[index show]
  resources :authors, only: %i[index show]
end
