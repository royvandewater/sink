class AddAlbumSyncLimitToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :album_sync_limit, :integer
  end
end
