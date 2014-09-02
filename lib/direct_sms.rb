require "direct_sms/version"
require "httparty"

module DirectSms
  class Message
    include HTTParty

    base_uri "api.directsms.com.au"

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
  end
end
