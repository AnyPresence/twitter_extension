TwitterExtension::Application.routes.draw do
  mount AnypresenceExtension::Engine => "/"
end
