class AddFieldStringToAnypresenceExtensionAccounts < ActiveRecord::Migration
  def change
    add_column :anypresence_extension_accounts, :field, :string

  end
end
