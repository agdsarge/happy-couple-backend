Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    namespace :api do
        namespace :v1 do
            post '/login', to: 'auth#login'
            post '/register', to: 'auth#register'
            get '/date', to: 'user#get_wedding_date'
        end
    end
end
