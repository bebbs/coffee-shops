require 'net/http'

class FoursquareApi
  API_URL = "https://api.foursquare.com/v2/venues/search"
  CLIENT_ID = ***REMOVED***
  CLIENT_SECRET = ***REMOVED***
  COFFEE_SHOP_CAT_ID = "4bf58dd8d48988d1e0931735"

  def self.fetch coordinates
    lat, long = coordinates[0], coordinates[1]
    res = get_response_body lat, long
    res["response"]["venues"]
  end

  private
  def self.get_response_body lat, long
    uri = URI(API_URL)
    params = {
      v: "20151108",
      m: "foursquare",
      radius: 800,
      client_id: CLIENT_ID,
      client_secret: CLIENT_SECRET,
      ll: "#{lat},#{long}",
      categoryId: COFFEE_SHOP_CAT_ID
    }

    uri.query = URI.encode_www_form(params)
    res = Net::HTTP.get_response(uri)
    JSON.parse(res.body)
  end
end