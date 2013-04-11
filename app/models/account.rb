class Account < ActiveRecord::Base
  scope :with_auto_sync, -> {where :auto_sync => true}

  validates_uniqueness_of :username, :if => :username


  def self.sync_all!
    Account.with_auto_sync.each do |account|
      sleep 1 # To avoid getting banned by Rdio
      account.sync!
    end
  end

  def active?
    rdio_token.present?
  end
  alias_method :active, :active?

  def rdio
    @rdio ||= Rdio.new(RDIO_TOKEN, rdio_token)
  end

  def rdio_token
    [rdio_key, rdio_secret] if rdio_key && rdio_secret
  end

  def sync!
    rdio.set_sync false, :keys => synced_track_keys
    rdio.set_sync true,  :keys => tracks_to_sync_keys
    update_attributes :last_synced_at => Time.now
  rescue => e
    Rails.logger.error "Account failed to sync. account.id: '#{id}'"
    Rails.logger.warn  e.backtrace
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
    case sync_type
    when 'playCount' 
      rdio.most_played_tracks :count => number_of_tracks_to_sync.to_i
    when 'dateAdded'
      rdio.recently_added_tracks :count => number_of_tracks_to_sync.to_i
    else
      raise "Invalid sync_type: #{sync_type}"
    end
  end

  def tracks_to_sync_keys
    tracks_to_sync.map do |track|
      track['key']
    end
  end
end
