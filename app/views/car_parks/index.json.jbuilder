json.array!(@car_parks) do |car_park|
  json.extract! car_park, :id, :address, :price, :url_image, :description, :state, :started_at, :ended_at, :started_time, :ended_time, :user_id, :district_id, :reservation_type_id
  json.url car_park_url(car_park, format: :json)
end
