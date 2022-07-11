Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '*path', to: 'sha_manager#show'
      post '*path', to: 'sha_manager#create'
    end
  end
end
