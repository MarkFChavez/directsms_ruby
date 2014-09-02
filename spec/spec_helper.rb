require 'bundler/setup'
require 'webmock/rspec'

Bundler.setup
WebMock.disable_net_connect!(allow_localhost: true)

require 'direct_sms'

RSpec.configure do |config|

end
