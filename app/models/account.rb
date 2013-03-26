class Account < ActiveRecord::Base
  scope :with_auto_sync, -> {where :auto_sync => true}
  validates_uniqueness_of :username, :if => :username

  def self.sync_all!
    Account.with_auto_sync.each do |account|
      account.sync!
      sleep 1 # To avoid getting banned by Rdio
    end
  end

  def active?
    rdio_token.present?
  end
  alias_method :active, :active?

  def rdio
    @rdio ||= Rdio.new :user_key => rdio_key, :user_sercret => rdio_secret
  end

  def sync!
    rdio.sync! number_of_tracks_to_sync
    # rdio.set_sync false, :keys => synced_track_keys
    # rdio.set_sync true,  :keys => tracks_to_sync_keys
  end

  def synced_tracks
    rdio.synced_tracks
  end

  def synced_track_keys
    synced_tracks.map do |track|
      track['key']
    end
  end

  def tracks_to_sync
    rdio.most_played_tracks :count => number_of_tracks_to_sync.to_i
  end

  def tracks_to_sync_keys
    tracks_to_sync.map do |track|
      track['key']
    end
  end
end
