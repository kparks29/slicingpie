class WelcomeMailer < ActionMailer::Base
  default from: user.email

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.welcome_mailer.invite.subject
  #
  def invite
    @greeting = "Hi"
    @key = SecureRandom.hex(25)

    mail to: "to@example.org"
  end
end


