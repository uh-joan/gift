class ChargeMailer < ActionMailer::Base
  default from: "giftbell.ultimate.app@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.charge_mailer.charge_confirmation.subject
  #
  def charge_confirmation(purchase)
    @greeting = "Hi"

    @purchase = purchase

    Rails.logger.debug "In charge confirmation for #{purchase.senderEmail.to_json()}"

    mail to: purchase.senderEmail, subject: "Purchase confirmation"

    # @user = user
    # mail to: user.email, subject: "Account activation"

    # mail to: "to@example.org"
  end
end
