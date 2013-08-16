module ActivityStation
  module Assertions
    def assert_activity(data)
      sent_events = activity_station_provider.sent_events
      event = sent_events.detect {|event|
        data.all? { |key, value|
          event[key.to_s] == value
        }
      }

      unless event
        raise "expected there to be an event with: %s\n\nbut got:\n%s" % [data, sent_events]
      end
    end

    def assert_no_activity
      unless activity_station_provider.sent_events.empty?
        raise "expected no activity but got:\n%s" % activity_station_provider.sent_events
      end
    end
  end
end
