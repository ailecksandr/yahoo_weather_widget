# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yahoo_weather_widget/version'

Gem::Specification.new do |spec|
  spec.name          = "yahoo_weather_widget"
  spec.version       = YahooWeatherWidget::VERSION
  spec.authors       = ["Alexandr Orlov"]
  spec.email         = ["morozhunce@gmail.com"]

  spec.summary       = %q{Small yahoo-weather-api widget for your sidebars.}
  spec.description   = %q{Gives you an information about weather by zip-code.}
  spec.homepage      = "https://github.com/ailecksandr"
  spec.license       = "MIT"

  spec.files         = Dir["{lib,vendor}/**/*"]
  spec.bindir        = "exe"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency 'nokogiri', '~> 1.6.6.2'
  spec.add_development_dependency 'yahoo_weather', '~> 1.1.1'
  spec.add_development_dependency "rake", "~> 10.0"
end
