# This migration comes from anypresence_extension (originally 20120215221851)
class CreateAnypresenceExtensionAccounts < ActiveRecord::Migration
  def change
    create_table :anypresence_extension_accounts do |t|
      t.string :application_id
      t.string :api_host
      t.string :api_token
      t.string :api_version

      t.timestamps
    end
  end
end
