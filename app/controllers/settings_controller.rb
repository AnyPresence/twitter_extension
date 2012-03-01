class SettingsController < AnypresenceExtension::SettingsController
  layout 'application'
  
  before_filter :find_api_version, :only => [:provision, :perform, :publish]
  before_filter :find_object_definition_name, :only => [:perform]
  
  def settings
    if request.put?
      if current_account.update_attributes params[:account], :without_protection => true
        flash[:notice] = "Account updated."
        redirect_to settings_path
      else
        flash[:alert] = "Account could not be updated."

        render :action => "settings", :controller => "settings"
      end
    end
  end

  def perform
    Twitter.configure do |config|
      config.consumer_key = current_account.twitter_consumer_key.strip
      config.consumer_secret = current_account.twitter_consumer_secret.strip
      config.oauth_token = current_account.twitter_oauth_token.strip
      config.oauth_token_secret = current_account.twitter_oauth_token_secret.strip
    end
   
    begin
      tweet_option = current_account.tweet_options.where(:name => @object_definition_name.downcase).first
      format = tweet_option.format
      tweet_text = AnypresenceExtensionWrapper::parse_format_string(format, @object_definition_name, params).to_s
      ret = Twitter.update tweet_text
      Rails.logger.info "twitter response: " + ret.inspect
      render :json => { :success => true }
    rescue
      Rails.logger.error "Unable to send tweet: " + $!.message
      render :json => { :success => false }
    end
  end
  
end

