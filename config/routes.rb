Rails.application.routes.draw do

#          new_user_session GET      /users/saml/sign_in(.:format)                       devise/saml_sessions#new
#              user_session POST     /users/saml/auth(.:format)                          devise/saml_sessions#create
#      destroy_user_session DELETE   /users/sign_out(.:format)                           devise/saml_sessions#destroy
#     metadata_user_session GET      /users/saml/metadata(.:format)                      devise/saml_sessions#metadata
# idp_sign_out_user_session GET|POST /users/saml/idp_sign_out(.:format)                  devise/saml_sessions#idp_sign_out


  devise_for :users, controllers: {
    saml_sessions: 'users/saml_sessions'
  }

  scope "/:locale", locale: /#{I18n.available_locales.join("|")}/ do

    resources :uke_regulations, only: [:index]

    resources :works, only: [:index] do
      post 'datatables_index', on: :collection # for User
      post 'datatables_index_trackable', on: :collection # for Trackable
      post 'datatables_index_user', on: :collection # for User
    end

    resources :users do
      get 'select2_index', on: :collection
      post 'datatables_index', on: :collection
      get 'datatables_index_role', on: :collection # Displays users for showed role
      get 'datatables_index_group', on: :collection # Displays users for showed group
      resources :attachments, module: :users, only: [:create] do
        post 'create_folder', on: :collection
      end
    end

    resources :roles do
      post 'datatables_index', on: :collection
      get 'datatables_index_user', on: :collection # Displays roles for showed user
      resources :users, only: [:create, :destroy], controller: 'roles/users'
    end    

    resources :groups do
      get 'select2_index', on: :collection
      post 'datatables_index', on: :collection
      get 'datatables_index_user', on: :collection # Displays groups for showed user
      resources :users, only: [:create, :destroy], controller: 'groups/users'
    end    

    resources :archives, except: [:destroy] do
      post 'datatables_index', on: :collection
      # resources :components, module: :archives, only: [:create] do
      #   post 'create_folder', on: :collection
      # end
      get 'help_new_edit', on: :collection
    end

    resources :archives, only: [], param: :uuid do
      get 'show_uuid', on: :member
      # get 'edit_uuid', on: :member
      # patch 'update_uuid', on: :member
      # get 'download_uuid', on: :member
      delete 'destroy_uuid', on: :member
      get 'send_link_archive_show_uuid_by_email', on: :member
    end


    get 'datatables/lang'
    get 'static_pages/home'

    root to: 'static_pages#home'
	end

  root to: redirect("/#{I18n.default_locale}", status: 302), as: :redirected_root
  # get "/*path", to: redirect("/#{I18n.default_locale}/%{path}", status: 302),
  #               constraints: { path: /(?!(#{I18n.available_locales.join("|")})\/).*/ },
  #               format: false


  namespace :api, defaults: { format: :json } do
    require 'api_constraints'
    namespace :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      get :token, controller: 'base_api'

    end

    namespace :v2 do
    end
  end
end
