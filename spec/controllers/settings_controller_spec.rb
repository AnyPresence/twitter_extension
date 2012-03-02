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
    
    it "should login successfully" do
      secure_parameters = generate_secure_parameters
      
      post :provision, :application_id => secure_parameters[:application_id], :anypresence_auth => secure_parameters[:anypresence_auth], :timestamp => secure_parameters[:timestamp]
      parsed_body = JSON.parse(response.body)
      parsed_body["success"].should == true    
    end
  end
  
  describe "tweet" do
    before(:each) do
      @account = Factory.create(:fully_assembled_account) 
      sign_in @account
    end
    
    it "should know how to tweet" do
      controller.instance_variable_set("@object_definition_name", "Outage")
      controller.should_receive(:find_object_definition_name)
      Twitter.stub(:update).and_return(true)
      post :perform
      parsed_body = JSON.parse(response.body)
      debugger
      parsed_body["success"].should == true
    end
  end
end
