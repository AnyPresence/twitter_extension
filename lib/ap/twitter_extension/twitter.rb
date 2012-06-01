require 'twitter'

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
        options[:outgoing_message_format] ||= account.outgoing_message_format
        
        raise "No message to tweet" if options[:outgoing_message_format].blank?
        
        ::Twitter.configure do |config|
          config.consumer_key = ENV["TWITTER_EXTENSION.CONSUMER_KEY"]
          config.consumer_secret = ENV["TWITTER_EXTENSION.CONSUMER_SECRET"]
          config.oauth_token = ENV["TWITTER_EXTENSION.OAUTH_TOKEN"]
          config.oauth_token_secret = ENV["TWITTER_EXTENSION.OAUTH_TOKEN_SECRET"]
        end

        begin
          tweet_text = ::AnypresenceExtensionWrapper::parse_format_string(options[:outgoing_message_format], object_instance.class.name, object_instance.attributes).to_s
          ret = ::Twitter.update tweet_text
          Rails.logger.info "twitter response: " + ret.inspect
        rescue
          Rails.logger.error "Unable to send tweet: " + $!.message
          Rails.logger.error $!.backtrace.join("\n")
        end
      end
    end
  end
end