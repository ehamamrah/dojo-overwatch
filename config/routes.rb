Rails.application.routes.draw do
  namespace :api do
    resources :heros
    resources :abilities
  end
end
