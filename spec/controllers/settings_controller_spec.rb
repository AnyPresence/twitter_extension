require 'spec_helper'

describe SettingsController do
  def generate_secure_parameters
    timestamp = Time.now.to_i
    app_id = @account.application_id
    {timestamp: timestamp.to_s, application_id: app_id, anypresence_auth: Digest::SHA1.hexdigest("#{ENV['SHARED_SECRET']}-#{app_id}-#{timestamp}") } 
  end
  
  describe "setup" do
    before(:each) do
      @account = Factory.build(:account)
    end
  end
end
