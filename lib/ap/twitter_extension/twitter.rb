require 'twitter'

module AP
  module TwitterExtension
    module Twitter
      def self.config_account(config={})

        config = HashWithIndifferentAccess.new(config)
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
        options = HashWithIndifferentAccess.new(options)
        options[:outgoing_message_format] ||= account.outgoing_message_format
        
        raise "No message to tweet" if options[:outgoing_message_format].blank?
        
        ::Twitter.configure do |config|
          config.consumer_key = ENV["TWITTER_EXTENSION_CONSUMER_KEY"] || account.twitter_consumer_key
          config.consumer_secret = ENV["TWITTER_EXTENSION_CONSUMER_SECRET"] || account.twitter_consumer_secret
          config.oauth_token = ENV["TWITTER_EXTENSION_OAUTH_TOKEN"] || account.twitter_oauth_token
          config.oauth_token_secret = ENV["TWITTER_EXTENSION_OAUTH_TOKEN_SECRET"] || account.twitter_oauth_token_secret
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
      
      def self.json_config
        @@json ||= ActiveSupport::JSON.decode(File.read("#{File.dirname(__FILE__)}/../../../manifest.json"))
      end
    end
  end
end