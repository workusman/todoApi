Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :todos, only: [:index, :create, :destroy, :update]
    end
  end
end
