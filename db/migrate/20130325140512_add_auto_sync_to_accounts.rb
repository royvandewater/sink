class AddAutoSyncToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :auto_sync, :boolean, :default => false
    add_index :accounts, :auto_sync
  end
end
