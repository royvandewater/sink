require 'spec_helper'

describe RdioAccount do

  describe "Rdio Account Client" do
    it "should use a client to interact with Rdio" do
      sut = RdioAccount.new(OpenStruct.new)
    end
  end

  describe 'sync!' do
    before(:each) do
      @client = FakeRdioClient.new
      @sut = RdioAccount.new(@client)
    end

    it "should unsync every track" do
      @client.should_receive(:unsync)
      @sut.sync!
    end

    it "should unsync all tracks in my track list" do
      MyTrackList.should_receive(:new)
      @sut.sync!
    end

    it "should sync top tracks" do
      # @client.should_receive(:sync_top_tracks!)
      # @sut.sync!      
    end
  end
end

class FakeRdioClient < Struct.new(:sync_top_tracks!, :unsync)
end
