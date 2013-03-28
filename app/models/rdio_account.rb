class RdioAccount
  def initialize(client)
    @client = client
  end

  def sync!
    @client.unsync TrackList.new(self).tracks
  end
end
