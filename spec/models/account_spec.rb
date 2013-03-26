require 'spec_helper'

describe Account do
  describe 'sync!' do
    before :each do
      @account = Account.create! :number_of_tracks_to_sync => 43
    end

    it "should call rdio's sync! method and pass in how many songs to sync" do
      @account.rdio.should_receive(:sync!).with 43
      @account.sync!
    end
  end
end
