require_relative '../models/weather_getter'
require_relative '../models/weather_to_file'

def run_weather
  @wo = WeatherGetter.new

  loop do
    @wo.perform!
    @wtf = WeatherToFile.new(@wo)
    @wtf.perform!
    sleep 15
  end
end

run_weather

