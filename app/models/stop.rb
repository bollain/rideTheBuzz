require 'rubygems'
require 'httparty'

class Stop < ActiveRecord::Base
	include HTTParty
	format :json

	def self.findStops()
		get('http://api.translink.ca/rttiapi/v1/buses?apikey=UeuMwgvJ7kQ2cgFuDMVr&routeNo=099', :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'})
	end


	def self.printData(string)
		puts "hello"
	end
end
