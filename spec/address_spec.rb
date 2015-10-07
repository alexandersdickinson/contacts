require('address')

describe(Address) do
  @@create_attribute = lambda do |key, value|
    attributes = {:street_address => "", :city => "", :state => "", :zip_code => ""}
    attributes.merge!({key => value})
    test_address = Address.new(attributes)
  end
  
  describe("#street_address") do
    it("returns the street address") do
      test_street_address = "5555 Fake Street"
      expect(@@create_attribute.call(:street_address, test_street_address).street_address()).to(eq(test_street_address))
    end
  end
    
  describe("#city") do
    it("returns the city") do
      test_city = "Long Beach"
      expect(@@create_attribute.call(:city, test_city).city()).to(eq(test_city))
    end
  end
    
  describe("#state") do
    it("returns the state") do
      test_state = "Cali"
      expect(@@create_attribute.call(:state, test_state).state()).to(eq(test_state))
    end
  end
    
  describe("#zip_code") do
    it("returns the zip code") do
      test_zip = "90210"
      expect(@@create_attribute.call(:zip_code, test_zip).zip_code()).to(eq(test_zip))
    end
  end
end