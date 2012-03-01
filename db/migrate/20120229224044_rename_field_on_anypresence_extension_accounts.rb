class RenameFieldOnAnypresenceExtensionAccounts < ActiveRecord::Migration
  def change
    rename_column :anypresence_extension_accounts, :field, :object_field
  end
end
