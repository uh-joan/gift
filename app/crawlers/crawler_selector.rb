class CrawlerSelector
  def call(event)
    # Execute the corresponding crawler
    # Rails.logger.debug "New charge has succeeded, the charge id is #{event.data.object.description}"

    # in the description there is the purchase identifier uuid
    @purchase = Purchase.find_by_identifier(event.data.object.description);
    Rails.logger.debug "Purchase payment confirmed! #{@purchase.to_json()}"
    # TODO
    # 1. Set the purchase.confirmedPayment to true
    # 2. change the purchase.status to processing
    # 3. case the vendor and execute the corresponding crawler!!

  end
end