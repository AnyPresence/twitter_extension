class AddFieldsToAnypresenceExtensionAccounts < ActiveRecord::Migration
  def change
    add_column :anypresence_extension_accounts, :twitter_consumer_key, :string
    add_column :anypresence_extension_accounts, :twitter_consumer_secret, :string
    add_column :anypresence_extension_accounts, :twitter_oauth_token, :string
    add_column :anypresence_extension_accounts, :twitter_oauth_token_secret, :string
  end
end
