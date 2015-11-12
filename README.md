# Yahoo weather widget

[![yahoo_weather_widget](https://pp.vk.me/c628226/v628226378/1f569/NJTdcjBfQ3s.jpg)](https://rubygems.org/gems/yahoo_weather_widget)

## Installation

To install the gem run 
```ruby 
gem install yahoo_weather_widget
```
or put
```ruby
gem 'yahoo_weather_widget'
```
in your Gemfile and run `bundle install`. 

## Usage

Add  `*= require 'yahoo_weather_widget'` to your `assets/stylesheets/application.css` file.

Controller with widget must looks like
```ruby
	require 'yahoo\_weather\_widget'

	class ExampleController < ApplicationController
	  #...

	  include YahooWeatherWidget

	  def example
	  	@yahoo_weather_widget = weather_api(922221) # here is your zip-code
	  end

	  #...
	end
```

Zip-code can be found on [Yahoo Weather](https://weather.yahoo.com/). That will be the last numbers in your city link
(ex. https://weather.yahoo.com/ukraine/khmelnytskyi-oblast/khmelnytskyy-922221/)

In views you can insert the widget by adding `<%=raw @weather_api %>`.

## Dependencies

**Yahoo\_weather\_icons** - [https://erikflowers.github.io/weather-icons/](https://erikflowers.github.io/weather-icons/).\
**Yahoo_weather** - [https://rubygems.org/gems/yahoo_weather/versions/1.1.1](https://rubygems.org/gems/yahoo_weather/versions/1.1.1).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ailecksandr/yahoo_weather_widget. 
This project is intended to be a safe, welcoming space for collaboration, and contributors.

## Future updates

- Add some visual styles;
- Add different types of widget (ex. horizontal bar, small block, default block);
- Add off-line mode of widget (more comfortable for developer);
- Add geo-data (instead zip-code in method);
- Write tests for gem.

## License

MIT LICENSE

Copyright (c) 2015 Alexandr Orlov <morozhunce@gmail.com>