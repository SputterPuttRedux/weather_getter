require 'pry'
require 'httparty'
require_relative '../models/weather_getter_logger.rb'

class WeatherGetter
  attr_accessor :current_temp, :heat_index, :wind_chill
  attr_accessor :description, :high, :low, :alert, :full_location, :humidity
  attr_reader :uri

  API_KEY = ENV['WUNDERGROUND_KEY']

  def initialize
    @uri = 'http://api.wunderground.com/api/'
  end

  def perform!
    puts "New WeatherGetter Object created with uri #{uri}"
    current_temp
    heat_index
    wind_chill
    description
    high
    low
    humidity
    full_location
  end

  def query_location
    '/q/PA/Conshohocken'
  end

  def conditions
      HTTParty.get(@uri + API_KEY + '/conditions' + query_location + '.json')
  end

  def forecast
      HTTParty.get(@uri + API_KEY + '/forecast' + query_location + '.json')
  end

  def current_temp
    @current_temp = conditions['current_observation']['temp_f']
  end

  def heat_index
    @heat_index = conditions['current_observation']['heat_index_f']
  end

  def wind_chill
    @wind_chill = conditions['current_observation']['windchill_f']
  end

  def description
    @description = conditions['current_observation']['weather']
  end

  def high
    @high = forecast['forecast']['simpleforecast']['forecastday'].first['high']['fahrenheit']
  end

  def low
    @low = forecast['forecast']['simpleforecast']['forecastday'].first['low']['fahrenheit']
  end

  def humidity
    @humidity = conditions['current_observation']['relative_humidity']
  end

  def full_location
    @full_location = conditions['current_observation']['display_location']['full']
  end

  def alert
    @alert = ''
  end

end