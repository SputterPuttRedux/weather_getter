class WeatherToBash
  attr_reader :wo
  def initialize(weather_obj)
    @wo = weather_obj
  end

  def current_temp
    system("echo #{@wo.current_temp}")
  end

  def full_location
    system("echo #{@wo.full_location}")
  end
end
