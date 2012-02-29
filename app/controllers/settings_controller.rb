class SettingsController < AnypresenceExtension::SettingsController
  def settings
    settings!
  end

  def perform
   Twitter.configure do |config|
     config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
     config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
     config.oauth_token = ENV['TWITTER_OAUTH_TOKEN']
     config.oauth_token_secret = ENV['TWITTER_OAUTH_TOKEN_SECRET']
   end

   Twitter.update("I'm tweeting with @gem!")
  
   render :json => { :success => true }
  end
  
end

