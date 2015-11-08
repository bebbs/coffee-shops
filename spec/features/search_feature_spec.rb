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

  context 'When there are no coffee shops near the postcode' do
    before do
      fill_in('postcode', with: 'B4D 1NPUT')
      click_button('Search')
    end

    it 'A no results found notice is displayed' do
      expect(page).to have_content('There are no results, please search again')
    end

    it 'The user can try again' do
      click_link('Reset Search')
      expect(page).not_to have_content('There are no results, please search again')
    end
  end

  context 'When there is a coffee shop near the postcode' do
    before do
      fill_in('postcode', with: 'SW1 1AA')
      click_button('Search')
    end

    it 'Displays the name of a coffee shop' do
      expect(page).to have_content('Coffee Geek and Friends')
    end

    it 'Displays the address of a coffee shop' do
      expect(page).to have_content('Unit 22 Cardinal Place')
    end
  end
end