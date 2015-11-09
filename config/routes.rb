Rails.application.routes.draw do
 
  resources :users, only: [:show, :destroy] do
    resources :finance_entries
  end

  resources :users do
    resources :health_entries
  end

  resources :users do 
    resources :fitness_entries
  end

  resources :users do
    resources :menstruation_entries
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/register', to: 'users#new'
  post '/register', to: 'users#create'
  get '/settings', to: 'users#edit'
  post '/settings', to: 'users#update'

  get '/', to: 'miscellaneous#index'
  get '/dashboard', to: 'miscellaneous#dashboard'

end

# # # # RAKE ROUTES
#    Prefix Verb   URI Pattern                                             Controller#Action
#         user_finance_entries GET    /users/:user_id/finance_entries(.:format)               finance_entries#index
#                              POST   /users/:user_id/finance_entries(.:format)               finance_entries#create
#       new_user_finance_entry GET    /users/:user_id/finance_entries/new(.:format)           finance_entries#new
#      edit_user_finance_entry GET    /users/:user_id/finance_entries/:id/edit(.:format)      finance_entries#edit
#           user_finance_entry GET    /users/:user_id/finance_entries/:id(.:format)           finance_entries#show
#                              PATCH  /users/:user_id/finance_entries/:id(.:format)           finance_entries#update
#                              PUT    /users/:user_id/finance_entries/:id(.:format)           finance_entries#update
#                              DELETE /users/:user_id/finance_entries/:id(.:format)           finance_entries#destroy
#                         user GET    /users/:id(.:format)                                    users#show
#                              DELETE /users/:id(.:format)                                    users#destroy
#          user_health_entries GET    /users/:user_id/health_entries(.:format)                health_entries#index
#                              POST   /users/:user_id/health_entries(.:format)                health_entries#create
#        new_user_health_entry GET    /users/:user_id/health_entries/new(.:format)            health_entries#new
#       edit_user_health_entry GET    /users/:user_id/health_entries/:id/edit(.:format)       health_entries#edit
#            user_health_entry GET    /users/:user_id/health_entries/:id(.:format)            health_entries#show
#                              PATCH  /users/:user_id/health_entries/:id(.:format)            health_entries#update
#                              PUT    /users/:user_id/health_entries/:id(.:format)            health_entries#update
#                              DELETE /users/:user_id/health_entries/:id(.:format)            health_entries#destroy
#                        users GET    /users(.:format)                                        users#index
#                              POST   /users(.:format)                                        users#create
#                     new_user GET    /users/new(.:format)                                    users#new
#                    edit_user GET    /users/:id/edit(.:format)                               users#edit
#                              GET    /users/:id(.:format)                                    users#show
#                              PATCH  /users/:id(.:format)                                    users#update
#                              PUT    /users/:id(.:format)                                    users#update
#                              DELETE /users/:id(.:format)                                    users#destroy
#         user_fitness_entries GET    /users/:user_id/fitness_entries(.:format)               fitness_entries#index
#                              POST   /users/:user_id/fitness_entries(.:format)               fitness_entries#create
#       new_user_fitness_entry GET    /users/:user_id/fitness_entries/new(.:format)           fitness_entries#new
#      edit_user_fitness_entry GET    /users/:user_id/fitness_entries/:id/edit(.:format)      fitness_entries#edit
#           user_fitness_entry GET    /users/:user_id/fitness_entries/:id(.:format)           fitness_entries#show
#                              PATCH  /users/:user_id/fitness_entries/:id(.:format)           fitness_entries#update
#                              PUT    /users/:user_id/fitness_entries/:id(.:format)           fitness_entries#update
#                              DELETE /users/:user_id/fitness_entries/:id(.:format)           fitness_entries#destroy
#                              GET    /users(.:format)                                        users#index
#                              POST   /users(.:format)                                        users#create
#                              GET    /users/new(.:format)                                    users#new
#                              GET    /users/:id/edit(.:format)                               users#edit
#                              GET    /users/:id(.:format)                                    users#show
#                              PATCH  /users/:id(.:format)                                    users#update
#                              PUT    /users/:id(.:format)                                    users#update
#                              DELETE /users/:id(.:format)                                    users#destroy
#    user_menstruation_entries GET    /users/:user_id/menstruation_entries(.:format)          menstruation_entries#index
#                              POST   /users/:user_id/menstruation_entries(.:format)          menstruation_entries#create
#  new_user_menstruation_entry GET    /users/:user_id/menstruation_entries/new(.:format)      menstruation_entries#new
# edit_user_menstruation_entry GET    /users/:user_id/menstruation_entries/:id/edit(.:format) menstruation_entries#edit
#      user_menstruation_entry GET    /users/:user_id/menstruation_entries/:id(.:format)      menstruation_entries#show
#                              PATCH  /users/:user_id/menstruation_entries/:id(.:format)      menstruation_entries#update
#                              PUT    /users/:user_id/menstruation_entries/:id(.:format)      menstruation_entries#update
#                              DELETE /users/:user_id/menstruation_entries/:id(.:format)      menstruation_entries#destroy
#                              GET    /users(.:format)                                        users#index
#                              POST   /users(.:format)                                        users#create
#                              GET    /users/new(.:format)                                    users#new
#                              GET    /users/:id/edit(.:format)                               users#edit
#                              GET    /users/:id(.:format)                                    users#show
#                              PATCH  /users/:id(.:format)                                    users#update
#                              PUT    /users/:id(.:format)                                    users#update
#                              DELETE /users/:id(.:format)                                    users#destroy
#                        login GET    /login(.:format)                                        sessions#new
#                              POST   /login(.:format)                                        sessions#create
#                       logout DELETE /logout(.:format)                                       sessions#destroy
#                     register GET    /register(.:format)                                     users#new
#                              POST   /register(.:format)                                     users#create
#                     settings GET    /settings(.:format)                                     users#edit
#                              POST   /settings(.:format)                                     users#update
#                              GET    /                                                       miscellaneous#index
#                    dashboard GET    /dashboard(.:format)                                    miscellaneous#dashboard