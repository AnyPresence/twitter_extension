module AP
  module TwitterExtension
    module Twitter
      def self.config_account(config={})
        if config.empty?
          raise "Nothing to configure!"
        end
        account = nil
        if !::TwitterExtension::Account.all.blank?
          account = ::TwitterExtension::Account.first
          account.update_attributes(config)
        else
          account = ::TwitterExtension::Account.new(config)
          account.save!
        end

        menu_options = config[:menu_options] 
        if !menu_options.nil?
          menu_options.each do |m|
            menu_option = account.menu_options.build(m)
            menu_option.save
          end
        end
      end
  
      # Builds message to tweet.
      #  +object_instance+ is the object instance
      #  +options+ is a hash that includes: +:from+, caller's phone number; +:to+, twilio phone number to send the text to
      def twitter_perform(object_instance, options={})
        account = ::TwitterExtension::Account.first
        consumer = AP::TwitterExtension::Sms::Consumer.new(account)
        options[:outgoing_message_format] ||= account.outgoing_message_format
        
        Twitter.configure do |config|
          config.consumer_key = account.twitter_consumer_key.strip
          config.consumer_secret = account.twitter_consumer_secret.strip
          config.oauth_token = account.twitter_oauth_token.strip
          config.oauth_token_secret = account.twitter_oauth_token_secret.strip
        end

        begin
          tweet_option = account.tweet_options.where(:name => @object_definition_name.downcase).first
          format = tweet_option.format
          tweet_text = AnypresenceExtensionWrapper::parse_format_string(format, @object_definition_name, params).to_s
          ret = Twitter.update tweet_text
          Rails.logger.info "twitter response: " + ret.inspect
        rescue
          Rails.logger.error "Unable to send tweet: " + $!.message
        end
      end
    end
  end
end