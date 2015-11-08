require 'rails_helper'
require 'foursquare_api'

describe FoursquareApi do
  context 'Given a latitude and longitude' do
    it 'Returns a list of places' do
      response = FoursquareApi.fetch([51.5008639550903,-0.143207214666344])
      place_names = ['Coffee Geek and Friends','TAP Coffee No. 193','Monmouth Coffee Company']

      response.each_with_index do |p, i|
        expect(p["name"]).to eq place_names[i]
      end
    end
  end
end