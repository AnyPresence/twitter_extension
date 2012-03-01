class SettingsController < AnypresenceExtension::SettingsController
  layout 'application'
  
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
   
   begin
     debugger
     ret = Twitter.update("I'm tweeting with @gem!!")
     Rails.logger.info "twitter response: " + ret.inspect
     render :json => { :success => true }
   rescue
     Rails.logger.error "Unable to send tweet: " + $!.message
     render :json => { :success => false }
   end

  end
  
end

