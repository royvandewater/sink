class AddSongsToSyncToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :songs_to_sync, :integer
  end
end
