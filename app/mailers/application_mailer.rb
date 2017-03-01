class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@caliconnects.mybluemix.net"
  layout 'mailer'
end
