require_relative "test_helper"

class ActivityStationTest < ActivityStation::TestCase
  before do
    ENV.delete("ACTIVITY_STATION_URL")
  end

  it "creates a provider for development if ACTIVITY_STATION_URL is set" do
    ENV["ACTIVITY_STATION_URL"] = "http://localhost:3000"
    provider = ActivityStation.configure("development")
    assert_instance_of ActivityStation::Provider, provider
  end

  it "creates a mock provider for development without ACTIVITY_STATION_URL" do
    provider = ActivityStation.configure("development")
    assert_instance_of ActivityStation::MockProvider, provider
  end

  it "creates a provider for production" do
    provider = ActivityStation.configure("production")
    assert_instance_of ActivityStation::Provider, provider
  end

  it "creates a mock provider for testing" do
    provider = ActivityStation.configure("test")
    assert_instance_of ActivityStation::MockProvider, provider
  end
end
