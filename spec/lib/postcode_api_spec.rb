require 'rails_helper'
require 'postcode_api'

describe PostcodeApi do
  context 'Returns latitude and longitude for postcodes' do
    it 'Formatted AA1A 1AA' do
      expect(PostcodeApi.fetch("SW1A 1AA")).to eq([51.5008639550903,-0.143207214666344])
    end
  end
end