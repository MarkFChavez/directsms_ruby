# DirectSms

DirectSms is a wrapper for using the api offered by directsms.com.au. The complete documentation can be downloaded 
here: http://www.directsms.com.au/api/HTTP_API.pdf

## Installation & Usage

Add this line to your application's Gemfile:

    gem 'direct_sms'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install direct_sms

To start using DirectSms, you'll need a username and a password. If you read the directsms docs, they support passing a 
connectionid as well. This is not supported for now.

### Getting your remaining balance

To get your account's balance, simply:

    sms = DirectSms::Message.new(username, password)
    response = sms.balance
    response.body # -> credits: 300.00

### Sending an SMS

To send an sms, you need to set the ff. attributes:

1. message - The content of your sms message
2. type - Only accepts two values; "1-way" & "2-way"
3. to - The recipient/s of the message
4. messageid - A unique identifier for the message. Used for tracking the reply of the receiver.

    sms = DirectSms::Message.new(username, password)
    sms.message = "Hello, world!"
    sms.type = "2-way" # -> enables the receiver to reply
    sms.to = "+639919302930" # -> to send to multiple recipients, use "," as delimiter.
    sms.messageid = "<id>"
    sms.send_message

### Errors

If you've found any errors on the documentation as well as the code, feel free to contact me on my email.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
