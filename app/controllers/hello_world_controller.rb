require 'rss'

class HelloWorldController < ApplicationController
  def index
    @earthquakes = HTTParty.get("http://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=2017-02-09&endtime=2017-02-13&minmagnitude=2")["features"].select do |quake|
      quake["properties"]["place"].downcase.include? "california"
    end

    @fires = RSS::Parser.parse('https://rmgsc.cr.usgs.gov/GeoMAC/DynContent/georss/nifc_large_firesW3C.xml', false).items

    @rivers = RSS::Parser.parse('http://water.weather.gov/ahps2/rss/alert/ca.rss', false).items

    @tsunami = RSS::Parser.parse('http://ptwc.weather.gov/feeds/ptwc_rss_pacific.xml', false).items

    @weather = RSS::Parser.parse('https://alerts.weather.gov/cap/ca.php?x=0', false).items
  end
end