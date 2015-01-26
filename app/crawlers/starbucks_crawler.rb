# require 'mechanize'

class StarbucksCrawler

  # def self.not_logged_in?(session)
  #   (session.title) == ACCOUNT_SIGN_IN
  # end
  #
  # def self.shopping_cart_not_updated?(session)
  #   (session.title) == EGIFT_PURCHASE_PAGE
  # end
  #
  # def self.add_egift_card_to_cart(purchase)
  #   @session = @session.form_with(:id => 'ecardform') do |form|
  #     form.radiobuttons_with(:name => 'selected_theme')[@cardTheme].check
  #
  #     recipient_name_field = form.field_with(:id => 'recipient_name')
  #     recipient_name_field.value = purchase.recipientName
  #
  #     recipient_email_field = form.field_with(:id => 'recipient_email')
  #     recipient_email_field.value = purchase.recipientName
  #
  #     message_field = form.field_with(:id => 'message')
  #     message_field.value = purchase.message
  #
  #     amount_field = form.field_with(:id => 'amount')
  #     amount_field.value = purchase.amount
  #
  #     sender_name_field = form.field_with(:id => 'sender_name')
  #     sender_name_field.value = purchase.senderName
  #
  #     sender_email_field = form.field_with(:id => 'sender_email')
  #     sender_email_field.value = purchase.senderEmail
  #
  #   end.submit
  # end

  # def self.confirm_shopping_cart_egift_amount
  #   puts 'Confirming eGift Amount.'
  #   @session = @session.form_with(:action => '/shop/UpdateeGiftCart')
  #   @session = @session.submit(@session.button_with(:name => /checkout/))
  # end
  #
  # def self.authenticate_session(signin_page)
  #   signin_page.form_with(:id => 'accountForm') do |form|
  #     account_field = form.field_with(:id => 'Account_UserName')
  #     account_field.value = USER_EMAIL
  #     password_field = form.field_with(:id => 'Account_PassWord')
  #     password_field.value = USER_PASSWORD
  #   end.submit
  # end

  def self.call(purchase)
    # Rails.logger.debug "Calling Starbucks Crawler #{purchase.to_json()}"
    puts "Calling Starbucks Crawler #{purchase.to_json()}"

    # a = Mechanize.new{|a| a.ssl_version, a.verify_mode = 'SSLv3', OpenSSL::SSL::VERIFY_NONE}
    #
    # a.get("https://www.starbucks.co.uk/account/signin") do |page|
    #   puts "On Starbucks account signin"
    #   # sign_in a, page
    #   @session  = a.click(page.link_with(:text => /Sign In/))
    #   puts "Sign in clicked"
    #   @session = authenticate_session @session
    #   puts "Successfully signed in!" if !not_logged_in? @session
    #   @session = nil if not_logged_in? @session
    #   puts 'Navigating to eGift Page.'
    #   @session = a.click(page.link_with(:text => /Starbucks Card eGift/))
    #   puts "On Starbucks Card egift"
    #   @session = a.click(@session.link_with(:href => /anytime/))
    #   puts "On anytime card egift page"
    #   puts 'Adding eGift to Cart.'
    #   add_egift_card_to_cart purchase
    #   @session = nil if shopping_cart_not_updated? @session
    #
    #   raise "Unable to add eGift to shopping cart." if @session.nil?
    #   confirm_shopping_cart_egift_amount
    #   puts "confirmed eGift card, proceed to checkout!"
    #   # add_egift_to_shopping_cart a, page
    #   # purchase_egift_card a, page
    #   #select_and_confirm_payment_method
    # end

  end
end