class RenameSongsToSyncToNumberOfTracksToSyncOnAccounts < ActiveRecord::Migration
  def change
    change_table :accounts do |table|
      table.rename :songs_to_sync, :number_of_tracks_to_sync
    end
  end
end
