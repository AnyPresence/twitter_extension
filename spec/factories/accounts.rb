FactoryGirl.define do
  factory :account, :class => AnypresenceExtension::Account do
    application_id "4f204040772c96c4d3000006"
    api_host "http://localhost:5000"
    extension_id "12345"
  end
  
  factory :fully_assembled_account, :class => AnypresenceExtension::Account do
    application_id "4f204040772c96c4d3000006"
    api_host "http://localhost:5000"
    extension_id "12345"
    twitter_consumer_key "some_consumer_key"
    twitter_consumer_secret "some_consumer_secret"
    twitter_oauth_token "some_oauth_token"
    twitter_oauth_token_secret "some_oauth_token_secret"
    
    after_build do |o|
      tweet_option =  Factory.build(:tweet_option)
      o.tweet_options << tweet_option
    end
  end
end