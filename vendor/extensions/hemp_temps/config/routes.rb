Refinery::Core::Engine.routes.draw do
  # Frontend routes
  namespace :hemp_temps do
    resources :hemp_temps, :path => '', :only => [:new, :create] do
      collection do
        get :thank_you
      end
    end
  end

  # Admin routes
  namespace :hemp_temps, :path => '' do
    namespace :admin, :path => 'refinery/hemp_temps' do
      resources :hemp_temps, :path => '' 
      resources :settings, :only => [:edit, :update]
    end
  end
end

