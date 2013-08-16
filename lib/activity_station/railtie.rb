require 'rails/railtie'

module ActivityStation
  class Railtie < ::Rails::Railtie
    initializer "activity_station.configure" do
      provider = ActivityStation.configure(Rails.env)
      config.activity_station = provider
    end
  end
end
