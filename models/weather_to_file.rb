class WeatherToFile
  def initialize(weather_obj)
    @wo = weather_obj
  end

  def wo_vars
    @wo_vars = @wo.instance_variables
    @wo_vars.delete(:@uri)
    @wo_vars
  end

  def perform!
    wo_vars.map do |v|
      for_send = v.to_s.delete('@').to_sym
      File.open("/Users/dionnestanfield/webDev/GeekTool/WeatherGetter/views/#{for_send}.txt", 'w+') do |file|
        file.write(@wo.send(for_send))
        puts "writing #{for_send} to #{file.path}"
      end
    end
  end
end

