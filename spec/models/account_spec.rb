require 'spec_helper'

describe Account do
  describe 'generate a new session' do
    before :each do
      @account = Account.create! :rdio_key => 'something-new'
    end

    it "should generate a session token" do
      @account.session_token.should_not be_nil
    end

    describe 'when the rdio_key changes' do
      before :each do
        @old_session_token = @account.session_token
        @account.update_attributes! :rdio_key => 'something-else'
      end

      it 'should generate a new session token' do
        @account.session_token.should_not == @old_session_token
      end
    end

    describe 'when account is updated but rdio_key stays the same' do
      before :each do
        @old_session_token = @account.session_token
        @account.update_attributes! :username => 'something-else'
      end

      it 'should not generate a new session token' do
        @account.session_token.should == @old_session_token
      end
    end
  end
end
