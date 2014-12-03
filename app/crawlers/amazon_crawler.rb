class AmazonCrawler
  def self.call(purchase)
    Rails.logger.debug "Calling Amazon Crawler #{purchase.to_json()}"
  end
end