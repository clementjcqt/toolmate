Geocoder.configure(
  lookup: :mapbox,
  api_key: ENV['MAPBOX_TOKEN'],
  timeout: 5,
  units: :km,

  # Caching (optional but recommended if you set up Redis/memcache):
  # cache: Redis.new,
  # cache_prefix: "geocoder:"
)
