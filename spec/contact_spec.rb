require('contact')

describe(Contact) do
  before() do
    Contact.clear()
  end
  
  @@create_contact = lambda do |key, value|
    fake_address = Address.new({:street_address => "", :city => "", :state => "", :zip_code => ""})
    attributes = {:phone => "", :address => fake_address, :email => "", :job_title => ""}
    attributes.merge!({key => value})
    Contact.new(attributes)
  end
  
  describe("#phone") do
    it("returns the contact\'s phone number") do
      test_phone = "555-0869"
      expect(@@create_contact.call(:phone, test_phone).phone()).to(eq(test_phone))
    end
  end
  
  describe("#address") do
    it("returns an object representing contact\'s address") do
      test_address = Address.new({:street_address => "", :city => "", :state => "", :zip_code => ""})
      expect(@@create_contact.call(:address, test_address).address()).to(eq(test_address))
    end
  end
  
  describe("#email") do
    it("returns an email address") do
      test_email = "fakeemail@aol.com"
      expect(@@create_contact.call(:email, test_email).email()).to(eq(test_email))
    end
  end
  
  describe("#job_title") do
    it("returns a job title") do
      test_title = "Chief Executive Officer"
      expect(@@create_contact.call(:job_title, test_title).job_title()).to(eq(test_title))
    end
  end
  
  describe("#save") do
    it("adds the contact to the list of contacts") do
      test_contact = @@create_contact.call(:phone, "")
      test_contact.save()
      expect(Contact.all()[0]).to(eq(test_contact))
    end
  end
  
  describe(".all") do
    it("starts as an empty array") do
      expect(Contact.all()).to(eq([]))
    end
  end
  
  describe(".clear") do
    it("empties the array containing all contacts") do
      contact1 = @@create_contact.call(:phone, "")
      contact1.save()
      contact2 = @@create_contact.call(:phone, "")
      contact2.save()
      Contact.clear()
      expect(Contact.all()).to(eq([]))
    end
  end
end