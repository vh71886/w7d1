Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


#   Prefix Verb   URI Pattern                                                                              Controller#Action
#    cats GET    /cats(.:format)                                                                          cats#index
#         POST   /cats(.:format)                                                                          cats#create
# new_cat GET    /cats/new(.:format)                                                                      cats#new
# edit_cat GET    /cats/:id/edit(.:format)                                                                 cats#edit
#     cat GET    /cats/:id(.:format)                                                                      cats#show
#        PATCH  /cats/:id(.:format)                                                                      cats#update
#        PUT    /cats/:id(.:format)                                                                      cats#update
#  users POST   /users(.:format)                                                                         users#create
# new_user GET    /users/new(.:format)                                                                     users#new
# new_session GET    /session/new(.:format)                                                                   sessions#new
# session DELETE /session(.:format)                                                                       sessions#destroy
#        POST   /session(.:format)                                                                       sessions#create

  resources :cats, except: :destroy
  resources :cat_rental_requests, only: [:new, :create] do
    member do
      post :approve
      post :deny
    end
  end
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

  root to: redirect('/cats')
end
