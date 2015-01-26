require 'test_helper'

class ChargeMailerTest < ActionMailer::TestCase
  test "charge_confirmation" do
    mail = ChargeMailer.charge_confirmation(purchase)
    assert_equal "Charge confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
