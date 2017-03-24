Rails.application.routes.draw do

  #resources :tags, except: [:new, :edit]
   # this would make available /tags

# Services swithed to tags
  # resources :services, except: [:new, :edit]
   # this would make available /services

  get 'authn/whoami', defaults: {format: :json}
  get 'authn/checkme'

  mount_devise_token_auth_for 'User', at: 'auth'

  scope :api, defaults: {format: :json}  do 
    resources :foos, except: [:new, :edit]
    resources :bars, except: [:new, :edit]

# Services swithed to tags, so this makes not too much sense
    resources :services, except: [:new, :edit] # this makes /api/services


    resources :images, except: [:new, :edit] do
      post "thing_images",  controller: :thing_images, action: :create
      get "thing_images",  controller: :thing_images, action: :image_things
      get "linkable_things",  controller: :thing_images, action: :linkable_things
    end

# Tags
    resources :tags, except: [:new, :edit] do
      post "thing_tags", controller: :thing_tags, action: :create
      get "thing_tags", controller: :thing_tags, action: :tag_things
      get "linkable_things",  controller: :thing_tags, action: :linkable_things
    end

    resources :things, except: [:new, :edit] do
      resources :thing_images, only: [:index, :create, :update, :destroy]
      resources :thing_tags, only: [:index, :create, :update, :destroy] #ThingTags
    end

    resources :things, except: [:new, :edit] do
      resources :thing_images, only: [:index, :create, :update, :destroy]
    end
  end      

  get "/client-assets/:name.:format", :to => redirect("/client/client-assets/%{name}.%{format}")
#  get "/", :to => redirect("/client/index.html")

  get '/ui'  => 'ui#index'
  get '/ui#' => 'ui#index'
  root "ui#index"
end
