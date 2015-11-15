json.array!(@alerts) do |alert|
  json.extract! alert, :id, :bus, :latitude, :longitude, :number
  json.url alert_url(alert, format: :json)
end
