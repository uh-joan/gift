class StarbucksCrawler
  def self.call(purchase)
    Rails.logger.debug "Calling Starbucks Crawler #{purchase.to_json()}"
  end
end