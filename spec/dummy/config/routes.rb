Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do  
      resources :outages
    end
    mount TwitterExtension::Engine => "/twitter_extension"
  end

end
