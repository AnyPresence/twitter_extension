Rails.application.routes.draw do

  resources :outages

  mount TwitterExtension::Engine => "/twitter_extension"
end
