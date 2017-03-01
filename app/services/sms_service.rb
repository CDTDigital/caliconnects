class SmsService
  def initialize
    auth_token = ENV['TWILIO_AUTHTOKEN']
    account_sid = ENV['TWILIO_ACCOUNTSID']

    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_message(number, body)
    puts body

    if Rails.env != "test" && Rails.env !="ci"
      begin
        @client.account.messages.create({
                                          :from => ENV['TWILIO_NUMBER'],
                                          :to => "+1" + number,
                                          :body => body
                                      })
      rescue Twilio::REST::RequestError
        puts "Error #{$!}"
      end
    end
  end
end