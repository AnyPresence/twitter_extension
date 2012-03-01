require AnypresenceExtension::Engine.root.join('app', 'models', 'anypresence_extension', 'account')

module AnypresenceExtension 
  class Account < ActiveRecord::Base
    has_many :tweet_options, :dependent => :destroy
  
  end
end