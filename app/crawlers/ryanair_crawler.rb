class RyanairCrawler
  def self.call(purchase)
    Rails.logger.debug "Calling RyanAir Crawler #{purchase.to_json()}"
  end
end