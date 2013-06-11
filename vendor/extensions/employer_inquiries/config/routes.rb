Refinery::Core::Engine.routes.draw do
  # Frontend routes
  namespace :employer_inquiries do
    resources :employer_inquiries, :path => '', :only => [:new, :create] do
      collection do
        get :thank_you
      end
    end
  end

  # Admin routes
  namespace :employer_inquiries, :path => '' do
    namespace :admin, :path => 'refinery/employer_inquiries' do
      resources :employer_inquiries, :path => '' 
      resources :settings, :only => [:edit, :update]
    end
  end
end

