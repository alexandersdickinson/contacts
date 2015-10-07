require('address')

describe(Address) do
  @@create_attribute = lambda do |key, value|
    attributes = {}
    attributes.merge!({key => value})
    Address.new(attributes)
  end
  
  describe("#street_address") do
    it("returns the street address") do
      test_street_address = "5555 Fake Street"
      expect(@@create_attribute.call(:street_address, test_street_address).street_address()).to(eq(test_street_address))
    end
  end
end