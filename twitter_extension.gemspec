$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "twitter_extension/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "twitter_extension"
  s.version     = TwitterExtension::VERSION
  s.authors     = ["Anypresence"]
  s.email       = ["fake@fake.local"]
  s.homepage    = ""
  s.summary     = ""
  s.description = "TODO: Description of TwitterExtension."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.2"
  s.add_dependency "json"
  s.add_dependency "multi_json"
  s.add_dependency "mongoid", "2.4.4"
  s.add_dependency "liquid"
  s.add_dependency "local-env"
  s.add_dependency "faraday"

  s.add_dependency "haml"
  s.add_dependency "hpricot"
  s.add_dependency "dynamic_form"
  s.add_dependency "simple_form"
  s.add_dependency "twitter"
  s.add_dependency "omniauth"
  s.add_dependency "omniauth-twitter"
  
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl"
  s.add_development_dependency "webmock"
  s.add_development_dependency "vcr"
  s.add_development_dependency "ruby-debug19"
end
