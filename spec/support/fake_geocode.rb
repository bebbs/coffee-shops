require 'sinatra/base'

class FakeGeocode < Sinatra::base
  get '/postcodes/:postcode' do
    json_response 200, 'locations.json'
  end

  private

  def json_response response_code, file_name
    content_type :json
    status response_code
    File.open(File.dirname(__FILENAME__) + '/fixtures/' + file_name, 'rb').read
  end

end
