class AsosCrawler
  def self.call(purchase)
    Rails.logger.debug "Calling Asos Crawler #{purchase.to_json()}"
  end
end