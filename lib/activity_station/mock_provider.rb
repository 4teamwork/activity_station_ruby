module ActivityStation
  class MockProvider
    attr_reader :sent_events

    def initialize
      reset!
    end

    def reset!
      @sent_events = []
    end

    def submit(event)
      @sent_events << event
    end
  end
end
