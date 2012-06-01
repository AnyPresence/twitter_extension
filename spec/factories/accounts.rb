FactoryGirl.define do
  factory :account, :class => TwitterExtension::Account do
    twitter_consumer_key "some_consumer_key"
    twitter_consumer_secret "some_consumer_secret"
    twitter_oauth_token "some_oauth_token"
    twitter_oauth_token_secret "some_oauth_token_secret"
  end
end