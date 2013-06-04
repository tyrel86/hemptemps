Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :contact_types do
    resources :contact_types, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :contact_types, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :contact_types, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
