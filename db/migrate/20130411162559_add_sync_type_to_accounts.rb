class AddSyncTypeToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :sync_type, :string
  end
end
