class AlertMailer < ApplicationMailer
  def alert_email(user, body)
    @user = user
    @body = body

    mail(to: @user.email, subject: 'CaliConnects Alert')
  end
end
