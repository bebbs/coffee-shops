require 'rails_helper'

feature 'Searching for a coffee shop' do
  context 'When on the homepage' do
    it 'Displays a post code input' do
      visit '/'

      expect(page).to have_field('postcode')
    end
  end
end