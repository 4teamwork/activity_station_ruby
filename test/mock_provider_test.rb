require_relative "test_helper"

class MockProviderTest < ActivityStation::TestCase
  include ActivityStation::Assertions

  before do
    @provider = ActivityStation::MockProvider.new
  end

  def activity_station_provider
    @provider
  end

  def generate_activity
    @provider.submit("kind" => "article_created",
                     "actor" => "John Doe",
                     "path" => "/blog",
                     "message" => "Welcome to my blog.")
  end

  it "assert activity on a single attribute (passes)" do
    generate_activity
    assert_activity "kind" => "article_created"
    assert_activity "actor" => "John Doe"
  end

  it "accepts symbols and strings" do
    generate_activity
    assert_activity kind: "article_created"
  end

  it "assert activity on a single attribute (fails)" do
    generate_activity
    assert_raises(RuntimeError) do
      assert_activity "kind" => "article_updated"
    end
  end

  it "assert activity on multiple attributes (passes)" do
    generate_activity
    assert_activity "kind" => "article_created", "path" => "/blog"
  end

  it "assert activity on multiple attributes (fails)" do
    generate_activity
    assert_raises(RuntimeError) do
      assert_activity "kind" => "article_created", "path" => "/blog/category"
    end
  end

  it "assert that no activity was sent (passes)" do
    assert_no_activity
  end

  it "assert that no activity was sent (fails)" do
    generate_activity
    assert_raises(RuntimeError) do
      assert_no_activity
    end
  end
end
