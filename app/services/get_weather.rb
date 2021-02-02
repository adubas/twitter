# frozen_string_literal: true

class GetWeather
  attr_reader :city, :api_key

  def initialize(city)
    @city = city
    @api_key = ENV['OPEN_WEATHER_KEY']
  end

  def current
    OpenweatherMap.get_current_weather(city, api_key)
  end

  def forecast
    forecast = OpenweatherMap.get_forecast(city, api_key)

    format_forecast = []
    forecast.each do |weather|
      format_forecast << "#{weather.values.pop}°C em #{weather.keys.pop.to_date}"
    end

    format_forecast
  end
end
