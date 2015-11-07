require 'rails_helper'

feature 'Searching for a coffee shop' do
  before :each do
    visit '/'
  end
  
  context 'When on the homepage' do
    it 'Displays a post code input' do
      expect(page).to have_field('postcode')
    end
  end

  context 'When there are no results for a postcode' do
    it 'A notice is displayed' do
      fill_in('postcode', with: 'B4D 1NPUT')
      click_button('Search')

      expect(page).to have_content('There are no results, please search again')
    end
  end
end