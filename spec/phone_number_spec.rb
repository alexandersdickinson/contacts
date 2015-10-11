require('phone_number')

describe(PhoneNumber) do
  @@create_phone_number = lambda do |key, value|
    attributes = {:area_code => nil, :number => nil, :type => ""}
    attributes.merge!({key => value})
    PhoneNumber.new(attributes)
  end
  
  describe("#area_code") do
    it("returns the area code") do
      test_area_code = 630
      expect(@@create_phone_number.call(:area_code, test_area_code).area_code()).to(eq(test_area_code))
    end
  end
  
  describe("#number") do
    it("returns a seven digit phone number") do
      test_number = 5550199
      expect(@@create_phone_number.call(:number, test_number).number()).to(eq(test_number))
    end
  end
  
  describe("#type") do
    it("returns the type of phone number") do
      test_type = "Primary"
      expect(@@create_phone_number.call(:type, test_type).type()).to(eq(test_type))
    end
  end
end