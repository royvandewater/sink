class RemoveAlbumSyncLimitFromAccounts < ActiveRecord::Migration
  def change
    remove_column :accounts, :album_sync_limit, :integer
  end
end
