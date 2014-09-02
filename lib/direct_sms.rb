require "direct_sms/version"
require "httparty"

module DirectSms
  class Message
    include HTTParty

    base_uri "api.directsms.com.au"

    attr_accessor :message
    attr_accessor :recipients

    MAX_SEGMENTS = 10

    def initialize(username, password)
      @username = username
      @password = password
    end
    
    def balance
      options = {
        query: {
          username: @username,
          password: @password
        }
      }
      
      self.class.get("/s3/http/get_balance", options)
    end

    def send
      options = {
        query: {
          username: @username,
          password: @password,
          message: @message,
          to: @recipients,
          type: "2-way",
          max_segments: MAX_SEGMENTS
        }
      }

      self.class.get("/s3/http/send_message", options)
    end
  end
end
