class XboxCrawler
  def self.call(purchase)
    Rails.logger.debug "Calling Xbox Crawler #{purchase.to_json()}"
  end
end