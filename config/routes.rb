Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    namespace :api do
        namespace :v1 do
            post '/login', to: 'auth#login'
            post '/register', to: 'auth#register'
            post '/setup', to: 'wedding#create_new_wedding_from_wizard'
            post '/todos/new', to: 'todo#create'
            post '/todos', to: 'todo#update'
            patch '/todos/:id', to: 'todo#edit'
            delete '/todos/:id', to: 'todo#destroy'
            post '/weddings/:id/attending', to: 'wedding#attending'
            post '/userweddings/:id/rsvp', to: 'user_wedding#update'
            get '/weddings/:id/todos', to: 'wedding#todos'
            get '/weddings/:slug', to: 'wedding#show'
            post '/add_guests', to: 'wedding#add_guests'
            get 'weddings/:id/guests', to: 'wedding#get_guests'
            get '/guests/', to: 'guest#index'
            delete '/guests/:id', to: 'guest#destroy'
            patch '/guests/:id', to: 'guest#edit'

            post '/invitations/:id', to: 'invitation#create'
            patch '/invitations/:id', to: 'invitation#edit'
            get '/weddings/:id/invitation', to: 'wedding#invitation'
            
        end
    end
end
