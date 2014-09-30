require "direct_sms/version"
require "httparty"

module DirectSms
  class Message
    include HTTParty

    base_uri "api.directsms.com.au"
    attr_accessor :message, :to, :max_segments, :type, :message_id
    attr_accessor :username, :password

    def initialize(attrs = {})
      attrs.each { |k, v| self.send("#{k}=", v) }
    end
    
    def balance
      options = { query: fetch_credentials }
      self.class.get("/s3/http/get_balance", options)
    end

    def send_message
      options = {
        query: fetch_credentials.merge(message: message,
                              to: to,
                              max_segments: max_segments, 
                              type: type,
                              messageid: message_id)
      }

      self.class.get("/s3/http/send_message", options)
    end

    private

    def fetch_credentials
      { username: username, password: password }
    end
  end
end
