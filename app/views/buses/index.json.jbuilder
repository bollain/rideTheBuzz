json.array!(@buses) do |bus|
  json.extract! bus, :id, :destination, :latitude, :longitude, :direction
  json.url bus_url(bus, format: :json)
end
