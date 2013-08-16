require "rest_client"
require "json"

module ActivityStation
  class Provider
    def initialize(url, client = RestClient)
      @url = url
      @client = client
    end

    def submit(event)
      post "/events", event
    end

    def post(path, data, headers = {})
      url = "#{@url}#{path}"
      headers = { :content_type => :json, :accept => :json }.merge(headers)
      @client.post url, JSON.dump(data), headers
    end
  end
end
