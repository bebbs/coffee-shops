class FindCoffeeShops
  def self.call postcode
    lat, long = PostcodeApi.fetch(postcode)
    if lat && long
      venue_json = FoursquareApi.fetch([lat, long])
      return create_coffee_shops venue_json
    end
    return []
  end

  private
  def self.create_coffee_shops venue_json
    coffee_shops = []
    venue_json.each do |venue|
      coffee_shops << build_coffee_shop_object(venue)
    end
    coffee_shops
  end

  def self.build_coffee_shop_object venue
    CoffeeShop.new(
      name: venue['name'],
      address: venue['location']['address'],
      latitude: venue['location']['lat'],
      longitude: venue['location']['lng'],
      popularity: venue['stats']['checkinsCount']
    )
  end
end