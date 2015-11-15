require 'rubygems'
require 'httparty'
require "json"

class Bus < ActiveRecord::Base
	include HTTParty
	format :json

	def self.findStops(route)
		response = HTTParty.get('http://api.translink.ca/rttiapi/v1/buses?apikey=UeuMwgvJ7kQ2cgFuDMVr&routeNo='+route, :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'})

		response.each do |b|
			Bus.create(direction: b['Direction'], latitude: b['Latitude'], longitude: b['Longitude'], destination: b['Destination'], bid: b['VehicleNo'] )
		end
		
	end

	def self.parseLatLon(br)
	    tempLat = br.latitude
	    tempLon = br.longitude
	    arr = [tempLat, tempLon]
	    arr
  	end

  	def self.imgStr(arr)
    	"https://maps.googleapis.com/maps/api/staticmap?center=" + arr.first.to_s + "," + arr.last.to_s + "&zoom=14&size=800x800&markers=" + arr.first.to_s + "," + arr.last.to_s + "&sensor=false"
  	end




end
