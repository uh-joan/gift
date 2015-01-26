# Preview all emails at http://localhost:3000/rails/mailers/charge_mailer
class ChargeMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/charge_mailer/charge_confirmation
  def charge_confirmation
    purchase = Purchase.first
    ChargeMailer.charge_confirmation(purchase)
  end

end
