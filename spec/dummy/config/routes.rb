Rails.application.routes.draw do

  mount TwitterExtension::Engine => "/twitter_extension"
end
