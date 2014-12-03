class SpotifyCrawler
  def self.call(purchase)
    Rails.logger.debug "Calling Spotify Crawler #{purchase.to_json()}"
  end
end