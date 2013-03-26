describe Rdio do

  describe 'sync!' do
    before :each do
      @rdio = Rdio.new
    end

    it 'should tell simple_rdio to mark 12 tracks for offline syncing' do
      @rdio.sync!
    end
  end
end
