# CoffeeHere

CoffeeHere is an application that, given a postcode, displays a number of nearby coffee shops. The shops can be displayed in a list, ordered by their Foursquare popularity, or on a map.

[See the application live on Heroku](https://coffeehere.herokuapp.com)

## How to run the application
*You must have Ruby and Ruby on Rails installed to run this application.*

1. `cd` into the CoffeeHere directory
2. Set the environment variables `FOURSQUARE_CLIENT_ID` and `FOURSQUARE_CLIENT_SECRET` with your own credentials.
3. Run `bundle install` to install all dependencies
4. Run `rails server` to start the application and visit `http://localhost:3000` in your browser to use it.
5. You may have to create a database to run the Rails server. Run `rake db:create` if prompted.

## Technologies used
### Front end
- *Skeleton CSS framework* - I used Skeleton as it provides a set of sensible CSS defaults to make the application user friendly across all screen sizes, yet isn't prescriptive or cumbersome to change in way something more complex (Bootstrap, Foundation etc.)
- *jQuery* - As it comes bundled with Rails, I found it quickest to prototype the app with jQuery, as I only needed Javascript to watch one form for changes. See `app/assets/javascripts/custom.js`
- *Google Maps*

### Back end
- *Rails* - The backend is built in Ruby on Rails.
- *APIs* - The service makes use of the postcodes.io API to get latitudes and longitudes for given postcodes, and the Foursquare API to 

### Structure
- *'Skinny' controller* - As the application makes use of several APIs, I abstracted the implementation of those away from the controller. I created a service object, `FindCoffeeShops`, that accepts a single postcode parameter from search_controller, and returns an array of CoffeeShop objects.
- *Abstracted API calls* - The `FindCoffeeShops` service object controls calls to any external APIs. This means that any part of the application can find coffee shops, yet isn't concerned with its implementation. The calls to the Foursquare and Postcode.io APIs are made in the `lib` folder.
- *ActiveModel* - As I wasn't persisting information from 3rd party APIs, it didn't make sense to have full ActiveRecord models managing the domain logic. Instead I included ActiveModel into the CoffeeShop class, which provides simple ActiveRecord-like helpers and attributes.

### Testing
**To run the test suite, run `rspec` from the root of the project directory**

- I used *RSpec* and *Capybara* to test the application. Feature tests are in `spec/features`, and tests of the API logic are in `spec/lib`
- As the application makes use of external APIs, I wanted to sandbox the tests to prevent 3rd party dependencies affecting the tests. Using the WebMock gem, any external HTTP requests made from the test suite are routed to internal Rack applications, `FakeFoursquareApi` and `FakePostcodeApi`. These are simple, lightweight Sinatra apps that read JSON files, each of which contain sample expected API responses from the real APIs.

## Future improvements
Given more time to work on this project, I'd like to improve or add the following features:

- The popularity of a coffee shop is currently the sum of all its checkins. It would be more robust to have more attributes contribute to this score, and experiment with weighting different factors.
- Find a way to effectively test the Google Maps implementation.
- Decouple presentation from logic in some of the views. Particularly the maps view.