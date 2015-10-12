require('address')

describe(Address) do
  @@create_address = lambda do |key, value|
    attributes = {:street_address => "", :city => "", :state => "", :zip_code => ""}
    attributes.merge!({key => value})
    Address.new(attributes)
  end
  
  describe("#street_address") do
    it("returns the street address") do
      test_street_address = "5555 Fake Street"
      expect(@@create_address.call(:street_address, test_street_address).street_address()).to(eq(test_street_address))
    end
  end
  
  describe("#city") do
    it("returns the city") do
      test_city = "Long Beach"
      expect(@@create_address.call(:city, test_city).city()).to(eq(test_city))
    end
  end
  
  describe("#state") do
    it("returns the state") do
      test_state = "Cali"
      expect(@@create_address.call(:state, test_state).state()).to(eq(test_state))
    end
  end
  
  describe("#zip_code") do
    it("returns the zip code") do
      test_zip_code = "Cali"
      expect(@@create_address.call(:zip_code, test_zip_code).zip_code()).to(eq(test_zip_code))
    end
  end
  
  describe("#to_s") do
    it("returns the address formatted") do
      test_address = Address.new({:street_address => "5555 Fake Street", :city => "Compton", :state => "CA", :zip_code => 90210})
      expect(test_address.to_s()).to(eq("5555 Fake Street\nCompton, CA 90210"))
    end
  end
end