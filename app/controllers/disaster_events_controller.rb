require 'rss'

class DisasterEventsController < ApplicationController
  def earthquakes
    current_month = Time.now.month.to_s.rjust(2, '0')
    current_day = Time.now.day.to_s.rjust(2, '0')
    previous_month = (Time.now - 3.days).month.to_s.rjust(2, '0')
    previous_day = (Time.now - 3.days).day.to_s.rjust(2, '0')

    @earthquakes = HTTParty.get("http://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=2017-#{previous_month}-#{previous_day}&endtime=2017-#{current_month}-#{current_day}&minmagnitude=2")["features"].select do |quake|
      quake["properties"]["place"].downcase.include? "california"
    end

    @earthquakes.map { |earthquake|
      earthquake["properties"]["time"] = Time.at(earthquake["properties"]["time"]/1000)

      earthquake
    }

    render json: @earthquakes
  end

  def fires
    @fires = RSS::Parser.parse('http://cdfdata.fire.ca.gov/incidents/rss.xml', false).items

    render json: @fires
  end

  def rivers
    @rivers = RSS::Parser.parse('http://water.weather.gov/ahps2/rss/alert/ca.rss', false).items

    render json: @rivers
  end

  def tsunami
    @tsunami = RSS::Parser.parse('http://ptwc.weather.gov/feeds/ptwc_rss_pacific.xml', false).items

    render json: @tsunami
  end

  def weather
    @weather = RSS::Parser.parse('https://alerts.weather.gov/cap/ca.php?x=0', false).items.map do |item|
      Crack::XML.parse(item.to_s)
    end

    render json: @weather
  end
end