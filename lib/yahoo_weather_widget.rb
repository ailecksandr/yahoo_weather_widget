require "yahoo_weather_widget/version"
require 'open-uri'

module YahooWeatherWidget
	
  class Engine < ::Rails::Engine; end

  def weather_api(zip_code)
    link = "http://weather.yahooapis.com/forecastrss?w=#{zip_code}&u=c"
    data = Nokogiri::XML(open(link))
    @weather_block = '<div class = "weather-container">'
    temp_date = data.xpath('//item//yweather:forecast')[0]['date'].split(' ')
    temp_date.pop
    temp_date[0], temp_date[1] = temp_date[1], temp_date[0]
    @weather_block += '<h3 class = "weather-date">' + temp_date.join(', ') +'</h3>'
    @weather_block += '<h2 class = "weather-current">'
    @weather_block += data.xpath('//item//yweather:condition')[0]['temp'] +' &deg;C</h2>'
    @weather_block += '<i class="wi ' + weathers[data.xpath('//item//yweather:forecast')[0]['code']] + '"></i>'
    @weather_block += '<h5 class = "weather-type">' + data.xpath('//item//yweather:forecast')[0]['text'] + '</h5>'
    @weather_block += '<h5 class = "weather-temperature"> Day: ' + data.xpath('//item//yweather:forecast')[0]['high']
    @weather_block += ' &deg;C.</br> Night: ' + data.xpath('//item//yweather:forecast')[0]['low'] + ' &deg;C.</h5>'
    @weather_block += '</div>'
  end

  def weathers
    {   '0': 'wi-tornado', '1' =>	'wi-day-storm-showers', '2'	=> 'wi-hurricane',
        '3'	=> 'wi-thunderstorm', '4'	=> 'wi-thunderstorm', '5'	=> 'wi-rain-mix',
        '6'	=> 'wi-rain-mix', '7'	=> 'wi-rain-mix', '8'	=> 'wi-hail',
        '9'	=> 'wi-showers', '10' =>	'wi-hail', '11' =>	'wi-showers',
        '12' => 'wi-showers', '13' =>	'wi-snow', '14' =>	'wi-day-snow',
        '15' =>	'wi-snow-wind', '16' =>	'wi-snow', '17' =>	'wi-hail',
        '18' =>	'wi-rain-mix', '19' =>	'wi-dust', '20' =>	'wi-fog',
        '21' =>	'wi-windy', '22' =>	'wi-smoke', '23' =>	'wi-strong-wind',
        '24' =>	'wi-strong-wind', '25' =>	'wi-snowflake-cold', '26' =>	'wi-cloudy',
        '27' =>	'wi-night-cloudy', '28' =>	'wi-day-cloudy', '29' =>	'wi-night-cloudy',
        '30' =>	'wi-day-cloudy', '31' =>	'wi-night-clear', '32' =>	'wi-day-sunny',
        '33' =>	'wi-night-partly-cloudy', '34' =>	'wi-day-sunny-overcast', '35' =>	'wi-rain-mix',
        '36' =>	'wi-hot', '37' =>	'wi-day-storm-showers', '38' =>	'wi-day-storm-showers',
        '39' =>	'wi-day-storm-showers', '40' => 'wi-showers', '41' =>	'wi-snow-wind',
        '42' =>	'wi-snow', '43' =>	'wi-snow-wind', '44' =>	'wi-day-sunny-overcast',
        '45' =>	'wi-day-storm-showers', '46' =>	'wi-snow', '47' =>	'wi-day-storm-showers', '3200' => 'wi-stars'
    }
  end

end
