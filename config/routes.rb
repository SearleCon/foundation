Foundation::Application.routes.draw do

  resources :plans, :only => [:index]

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users

  resources :suggestions, only: [:new, :create]

  #contact routes
  match '/contact_us' => 'contact#new', :as => 'contact_us', :via => :get
  match '/send_contact_email' => 'contact#create', :as => 'send_contact_email', :via => :post

  #non-dynamic pages go here
  match '/terms_and_conditions', to: 'static_pages#terms_and_conditions', via: :get
  match '/privacy_policy', to: 'static_pages#privacy_policy', via: :get
  match '/faq', to: 'static_pages#faq', via: :get
  match '/about', to: 'static_pages#about', via: :get


  #handle all routing errors
  match "*path", :to => "application#routing_error"

end

# use command 'annotate --routes' in your console to generate the list of routes below courtesy of Annotate gem

#== Route Map
# Generated on 28 Nov 2012 11:25
#
#                     root        /                               home#index
#         new_user_session GET    /users/sign_in(.:format)        devise/sessions#new
#             user_session POST   /users/sign_in(.:format)        devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)       devise/sessions#destroy
#            user_password POST   /users/password(.:format)       devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)   devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)  devise/passwords#edit
#                          PUT    /users/password(.:format)       devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)         devise/registrations#cancel
#        user_registration POST   /users(.:format)                devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)        devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)           devise/registrations#edit
#                          PUT    /users(.:format)                devise/registrations#update
#                          DELETE /users(.:format)                devise/registrations#destroy
#                    users GET    /users(.:format)                users#index
#                          POST   /users(.:format)                users#create
#                 new_user GET    /users/new(.:format)            users#new
#                edit_user GET    /users/:id/edit(.:format)       users#edit
#                     user GET    /users/:id(.:format)            users#show
#                          PUT    /users/:id(.:format)            users#update
#                          DELETE /users/:id(.:format)            users#destroy
#     terms_and_conditions GET    /terms_and_conditions(.:format) static_pages#terms_and_conditions
#           privacy_policy GET    /privacy_policy(.:format)       static_pages#privacy_policy
#                      faq GET    /faq(.:format)                  static_pages#faq
#                    about GET    /about(.:format)                static_pages#about
#               contact_us GET    /contact_us(.:format)           static_pages#contact_us
#                                 /*path(.:format)                application#routing_error
