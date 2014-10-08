require "direct_sms/version"
require "direct_sms/configuration"
require "direct_sms/message"

module DirectSms

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end

end
