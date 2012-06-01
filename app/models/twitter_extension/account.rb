module TwitterExtension 
  class Account
    include ActiveModel::MassAssignmentSecurity
    include Mongoid::Document
    include Mongoid::Timestamps
    
    field :twitter_consumer_key, type: String
    field :twitter_consumer_secret, type: String
    field :twitter_oauth_token, type: String
    field :twitter_oauth_token_secret, type: String
    field :outgoing_message_format, type: String

  end
end