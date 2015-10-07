require('contact')

describe(Contact) do
  @@create_attribute = lambda do |key, value|
    fake_address = Address.new({:street_address => "", :city => "", :state => "", :zip_code => ""})
    attributes = {:phone => "", :address => fake_address, :email => "", :job_title => ""}
    attributes.merge!({key => value})
    Contact.new(attributes)
  end
  
  describe("#phone") do
    it("returns the contact\'s phone number") do
      test_phone = "555-0869"
      expect(@@create_attribute.call(:phone, test_phone).phone()).to(eq(test_phone))
    end
  end
  
  describe("#address") do
    it("returns an object representing contact\'s address") do
      test_address = Address.new({:street_address => "", :city => "", :state => "", :zip_code => ""})
      expect(@@create_attribute.call(:address, test_address).address()).to(eq(test_address))
    end
  end
  
  describe("#email") do
  end
  
  describe("#job_title") do
  end
end