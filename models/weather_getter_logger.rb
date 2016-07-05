require 'logger'

module WeatherGetterLogger

  module Messenger
    def to_log(msg)
      file = File.open('../log/weather_getter.log')
      logger = Logger.new(file)
      logger.info(msg)
    end
  end
end