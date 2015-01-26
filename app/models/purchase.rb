class Purchase < ActiveRecord::Base

  # Sends activation email.
  def send_confirmation_email
    # Rails.logger.debug "In sending confirmation email"
    puts "In sending confirmation email"
    ChargeMailer.charge_confirmation(self)
    # UserMailer.account_activation(self).deliver_now
    # ChargeMailer.charge_confirmation(self).deliver_now
  end

end
