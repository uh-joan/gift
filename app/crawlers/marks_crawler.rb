class MarksCrawler
  def self.call(purchase)
    Rails.logger.debug "Calling M&S Crawler #{purchase.to_json()}"
  end
end