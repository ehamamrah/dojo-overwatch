Rails.application.routes.draw do
  namespace :api do
    resources :heros do
      member do
        get '/abilities', to: 'heros#abilities'
      end
    end
    resources :abilities
  end
end
