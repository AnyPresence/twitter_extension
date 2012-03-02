module AnypresenceExtensionWrapper
  class Wrapper
    def initialize(account_id)
      @account = AnypresenceExtension::Account.find_by_id(account_id)
    end
    
    # Builds an AnypresenceExtension client for accessing the platform api.
    #
    # Returns a client
    def ap_client(*adhoc_api_version)
      version = adhoc_api_version.empty? ? 'latest' : adhoc_api_version[0]
      @ap_client ||= AnypresenceExtension::Client.new(@account.api_host, @account.api_token, @account.application_id, version)
    end
    
    # Gets object definition metadata using API call.
    #
    # Returns the parsed json response.
    def object_definition_metadata
      version = @account.api_version.nil? ? 'latest' : @account.api_version
      response = ap_client(version).metadata.fetch

      Rails.logger.info "response: " + response.inspect
      parsed_json = []
      case response.status
      when 200
        begin
          parsed_json = ActiveSupport::JSON.decode(response.body)
        rescue MultiJson::DecodeError
          raise "Unable to decode the JSON message."
        end
      else
        raise "Unable to get a response."
      end

      parsed_json
    end

    # Gets object definition names for an application
    #
    # Returns an array of object names.
    def object_definition_mappings
      parsed_json = object_definition_metadata

      object_names = []
      parsed_json.each do |object_definition|
        object_names << object_definition["name"].downcase
      end
      object_names
    end
  end
 
end