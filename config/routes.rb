Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      post :auth, to: 'user_token#create'
      
      resources :locations do
        resources :recordings
      end
    end
  end

  resources :locations
end
