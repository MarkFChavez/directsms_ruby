require 'spec_helper'
require 'net/http'

describe DirectSms do
  let!(:username) { "username" }
  let!(:password) { "password" }

  describe "balance" do
    it 'returns the remaining balance' do
      stub_request(:get, "http://api.directsms.com.au/s3/http/get_balance?password=#{password}&username=#{username}").
      to_return(:status => 200, :body => "credit: 300.00", :headers => {})

      sms = DirectSms::Message.new(username, password)
      expect(sms.balance.body).to eq "credit: 300.00"
    end
  end

  describe "sending sms" do
    it 'sends an sms message' do
      stub_request(:get, "http://api.directsms.com.au/s3/http/send_message?max_segments=10&message=This%20is%20a%20test&password=password&to=%2B639178574111&messageid=&type=2-way&username=username").
        to_return(:status => 200, :body => "id: 1234567890", :headers => {})

      sms = DirectSms::Message.new(username, password, { type: "2-way", max_segments: 10 })
      sms.message = "This is a test"
      sms.to = "+639178574111"

      expect(sms.send.body).to eq "id: 1234567890"
    end
  end
end
