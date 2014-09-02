require 'spec_helper'

describe DirectSms do
  let!(:username) { "mchavez" }
  let!(:password) { "skyhealth123" }

  describe 'configuration' do
    it 'returns the remaining balance' do
      sms = DirectSms::Message.new(username, password)
      puts sms.balance
    end
  end
end
