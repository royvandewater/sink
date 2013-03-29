class Rdio
  delegate :begin_authentication,    :to => :@simple_rdio
  delegate :complete_authentication, :to => :@simple_rdio
  delegate :token,                   :to => :@simple_rdio

  def initialize(app_token, user_token=nil)
    @simple_rdio = SimpleRdio.new(app_token, user_token)
  end

  def most_played_tracks(options={})
    call 'getTracksInCollection', :sort => 'playCount', :count => options[:count]
  end

  def set_sync(sync, options={})
    call 'setAvailableOffline', :offline => sync, :keys => options[:keys].join(',')
  end

  def synced_tracks(options={})
    batch = 0
    @synced_tracks = []

    while true do
      old_count = @synced_tracks.count

      @synced_tracks.concat synced_tracks_in_batch batch

      return @synced_tracks if old_count == @synced_tracks.count
      batch += 1
    end
  end

  def username
    @username ||= current_user['username']
  end

  protected
  def call(method, options={})
    result = @simple_rdio.call method, options
    result['result']
  end

  def current_user
    @current_user ||= call 'currentUser', :extras => 'username'
  end

  def synced_tracks_in_batch(batch)
    count = 500
    start = batch * count
    call 'getOfflineTracks', :start => start, :count => count, :extras => 'playCount'
  end
end
