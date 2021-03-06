require 'net/http'

module Foostastic
  class Webhook
    def run
      url = Conf.settings.webhook_url
      return unless url
      response = Net::HTTP.get_response(URI(url))
      if response.code != '200'
        raise "HTTP GET to #{uri.to_s} failed with error #{response.code}"
      end
    end

    def run!
      begin
        run
      rescue
      end
    end
  end
end
