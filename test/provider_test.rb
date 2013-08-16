require_relative "test_helper"

class ProviderTest < ActivityStation::TestCase
  before do
    @client = Minitest::Mock.new
    @provider = ActivityStation::Provider.new("http://activity.example.com", @client)
  end

  it "issues a post request to /events" do
    @client.expect(:post, nil, ["http://activity.example.com/events",
                                "{\"kind\":\"job_accepted\"}",
                                {content_type: :json, accept: :json}])
    @provider.submit("kind" => "job_accepted")
    @client.verify
  end
end
