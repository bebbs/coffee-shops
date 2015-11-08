require 'sinatra/base'

class FakePostcodeApi < Sinatra::Base
  get '/postcodes/:postcode' do
    bad_postcode = "B4D1NPUT"
    if params[:postcode] == bad_postcode
      json_response 404, 'no_locations.json'
    else
      json_response 200, 'locations.json'
    end
  end

  private

  def json_response response_code, file_name
    content_type :json
    status response_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end

end
