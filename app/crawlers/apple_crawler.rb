class AppleCrawler
  def self.call(purchase)
    Rails.logger.debug "Calling Apple Crawler #{purchase.to_json()}"
  end
end