Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    namespace :api do
        namespace :v1 do
            post '/login', to: 'auth#login'
            post '/register', to: 'auth#register'
            post '/setup', to: 'wedding#create_new_wedding_from_wizard'
            post '/todos', to: 'todo#update'
            get '/weddings/:id/todos', to: 'wedding#todos'
            post '/add_guests', to: 'wedding#add_guests'
        end
    end
end
