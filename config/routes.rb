Rails.application.routes.draw do
  namespace :api do
    resources :heros do
      member do
        resources :abilities
      end
    end
  end
end
