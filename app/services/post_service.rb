# frozen_string_literal: true

class PostService
  attr_reader :user, :token, :city

  def initialize(dados)
    @user = dados[:user]
    @token = dados[:token]
    @city = dados[:city]
  end

  def call
    generate_client.update(compose_tweet)
  end

  def generate_client
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_KEY']
      config.consumer_secret     = ENV['TWITTER_SECRET']
      config.access_token        = user
      config.access_token_secret = token
    end
  end

  def compose_tweet
    current = GetWeather.new(city).current
    forecast = GetWeather.new(city).forecast
    "Na cidade de #{city}, a temperatura é de #{current}°C e a previsão para os próximos dias é de #{forecast[0]}, #{forecast[1]}, #{forecast[2]}, #{forecast[3]} e #{forecast[4]}."
  end
end
