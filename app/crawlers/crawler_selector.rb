class CrawlerSelector
  def call(event)
    # Execute the corresponding crawler
    # Rails.logger.debug "New charge has succeeded, the charge id is #{event.data.object.description}"

    # in the description there is the purchase identifier uuid
    @purchase = Purchase.find_by_identifier(event.data.object.description);
    Rails.logger.debug "Purchase payment confirmed."

    if @purchase.confirmedPayment == false
      # 1. Set the purchase.confirmedPayment to true
      @purchase.update_attribute(:confirmedPayment,true);

      # 2. change the purchase.status to processing
      @purchase.update_attribute(:status,'processing');

      # 3. case the vendor and execute the corresponding crawler!!
      case @purchase.vendor
        when 'Starbucks' then StarbucksCrawler.call(@purchase)
        when 'Asos' then AsosCrawler.call(@purchase)
        when 'Spotify' then SpotifyCrawler.call(@purchase)
        when 'Apple' then AppleCrawler.call(@purchase)
        when 'Xbox' then XboxCrawler.call(@purchase)
        when 'M&S' then MarksCrawler.call(@purchase)
        when 'Ryan Air' then RyanairCrawler.call(@purchase)
        when 'Amazon' then AmazonCrawler.call(@purchase)
      end

    else
      Rails.logger.debug "Oops. Something went wrong. The payment was previously confirmed."
    end

  end
end