require 'rss'

class DisasterEventsController < ApplicationController
  def earthquakes
    @earthquakes = HTTParty.get("http://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=2017-02-09&endtime=2017-02-13&minmagnitude=2")["features"].select do |quake|
      quake["properties"]["place"].downcase.include? "california"
    end

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