Rails.application.routes.draw do
  resources :states, except: [:new, :edit]
  resources :cities, except: [:new, :edit]

  scope :api, defaults: { format: 'json' } do
    resources :cities, :only => [ :index, :show ]
    resources :states, :only => [ :index, :show ]
  end

end
