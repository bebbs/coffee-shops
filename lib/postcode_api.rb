require 'net/http'

class PostcodeApi

  API_URL = "https://api.postcodes.io/postcodes"

  def self.fetch postcode
    postcode.delete!(" ")
    res = get_response_body postcode
    if res["status"] == 404
      nil
    else
      get_coordinates res
    end
  end

  private
  def self.get_coordinates response
    lat = response["result"]["latitude"]
    long = response["result"]["longitude"]
    [lat, long]
  end

  def self.get_response_body postcode
    uri = URI(API_URL + "/#{postcode}")
    res = Net::HTTP.get_response(uri)
    JSON.parse(res.body)
  end
end