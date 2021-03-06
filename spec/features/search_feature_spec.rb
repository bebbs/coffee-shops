require 'rails_helper'

feature 'Searching for a coffee shop' do
  before :each do
    visit '/'
  end

  context 'When on the homepage' do
    it 'Displays a post code input' do
      expect(page).to have_field('postcode')
    end

    it 'Blank postcode input displays a no results message' do
      click_button('Search')

      expect(page).to have_content('There are no results, please search again')
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

  context 'Coffee shops are ordered by the number of checkins' do
    before do
      fill_in('postcode', with: 'SW1 1AA')
      click_button('Search')
    end

    it 'Highest ranked first' do
      within('ul.coffee-shops li:nth-child(1)') do
        expect(page).to have_css('span.listing-name', text: 'Monmouth Coffee Company')
      end
    end

    it 'Lowest ranked last' do
      within('ul.coffee-shops li:nth-child(3)') do
        expect(page).to have_css('span.listing-name', text: 'Coffee Geek and Friends')
      end
    end
  end
end