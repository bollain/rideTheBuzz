json.array!(@stops) do |stop|
  json.extract! stop, :id, :stopNumber, :onStreet, :atStreet, :lat, :lon
  json.url stop_url(stop, format: :json)
end
