require "activity_station/version"
require "activity_station/provider"
require "activity_station/mock_provider"
require "activity_station/railtie" if defined?(Rails)

module ActivityStation
  def self.configure(env)
    url = config[:url]
    case env
    when "test"; MockProvider.new
    when "development"
      if url
        Provider.new(url)
      else
        MockProvider.new
      end
    else
      Provider.new(url)
    end
  end

  def self.config
    {url: ENV["ACTIVITY_STATION_URL"]}
  end
end
