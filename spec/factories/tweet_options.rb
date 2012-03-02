FactoryGirl.define do
  factory :tweet_option do
    name 'outage'
    format '{{title}} : {{description}}'
  end
end