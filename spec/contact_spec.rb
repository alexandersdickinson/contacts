require('contact')

describe(Contact) do
  before() do
    Contact.clear()
  end
  
  @@create_contact = lambda do |key, value|
    fake_address = Address.new({:street_address => "", :city => "", :state => "", :zip_code => ""})
    attributes = {:first_name => "", :last_name => "", :phone => "", :address => fake_address, :email => "", :job_title => ""}
    attributes.merge!({key => value})
    Contact.new(attributes)
  end
  
  describe("#id") do
    it("returns the id") do
      expect(@@create_contact.call(:phone, "").id()).to(eq(1))
    end
  end
  
  describe("#first_name") do
    it("returns the first name") do
      test_name = "John"
      expect(@@create_contact.call(:first_name, test_name).first_name()).to(eq(test_name))
    end
  end
  
  describe("#last_name") do
    it("returns the last name") do
      test_name = "Smith"
      expect(@@create_contact.call(:last_name, test_name).last_name()).to(eq(test_name))
    end
  end
  
  describe("#phone") do
    it("returns the contact\'s phone number") do
      test_phone = "555-0199"
      expect(@@create_contact.call(:phone, test_phone).phone()).to(eq([test_phone]))
    end
    
    it("returns a list of phone numbers") do
      test_phone1 = "555-1099"
      test_phone2 = "555-0199"
      test_contact = @@create_contact.call(:phone, test_phone1)
      test_contact.add_phone(test_phone2)
      expect(test_contact.phone()).to(eq([test_phone1, test_phone2]))
    end
  end
  
  describe("#address") do
    it("returns an object representing contact\'s address") do
      test_address = Address.new({:street_address => "", :city => "", :state => "", :zip_code => ""})
      expect(@@create_contact.call(:address, test_address).address()).to(eq([test_address]))
    end
    
    it("returns a list of addresses") do
      test_address1 = "Fake Street"
      test_address2 = "Ersatz Street"
      test_contact = @@create_contact.call(:address, test_address1)
      test_contact.add_address(test_address2)
      expect(test_contact.address()).to(eq([test_address1, test_address2]))
    end
  end
  
  describe("#email") do
    it("returns an email address") do
      test_email = "fakeemail@aol.com"
      expect(@@create_contact.call(:email, test_email).email()).to(eq([test_email]))
    end
    
    it("returns a list of email addresses") do
      test_email1 = "fake@aol.com"
      test_email2 = "fake@yahoo.com"
      test_contact = @@create_contact.call(:email, test_email1)
      test_contact.add_email(test_email2)
      expect(test_contact.email()).to(eq([test_email1, test_email2]))
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
    
    it("sorts contacts alphabetically by last name") do
      test_contact = @@create_contact.call(:last_name, "Zachary")
      test_contact.save()
      test_contact2 = @@create_contact.call(:last_name, "Peters")
      test_contact2.save()
      test_contact3 = @@create_contact.call(:last_name, "Thompson")
      test_contact3.save()
      expect(Contact.all()).to(eq([test_contact2, test_contact3, test_contact]))
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
  
  describe(".find") do
    it("finds a contact associated with an id number") do
      contact1 = @@create_contact.call(:first_name, "Ralph")
      contact1.save()
      contact2 = @@create_contact.call(:first_name, "Bob")
      contact2.save()
      contact3 = @@create_contact.call(:first_name, "Phillip")
      contact3.save()
      expect(Contact.find(contact2.id())).to(eq(contact2))
    end
  end
  
  describe("#add_address") do
    it("adds an address") do
      test_contact = @@create_contact.call(:address, "Fake Address")
      test_contact.add_address("Another Fake Address")
      expect(test_contact.address()).to(eq(["Fake Address", "Another Fake Address"]))
    end
  end
  
  describe("#delete_address") do
    it("deletes an address") do
      test_contact = @@create_contact.call(:address, "Fake Address")
      test_contact.add_address("Another Fake Address")
      test_contact.delete_address(0)
      expect(test_contact.address()).to(eq(["Another Fake Address"]))
    end
  end
  
  describe("#edit_address") do
    it("edits an address") do
      test_contact = @@create_contact.call(:address, "Fake Address")
      test_contact.edit_address(0, "Replacement Address")
      expect(test_contact.address()).to(eq(["Replacement Address"]))
    end
  end
  
  describe("#add_phone") do
    it("adds a phone number") do
      test_contact = @@create_contact.call(:phone, "Fake Phone")
      test_contact.add_phone("Another Fake Phone")
      expect(test_contact.phone()).to(eq(["Fake Phone", "Another Fake Phone"]))
    end
  end
  
  describe("#delete_phone") do
    it("deletes a phone number") do
      test_contact = @@create_contact.call(:phone, "Fake Phone")
      test_contact.add_phone("Another Fake Phone")
      test_contact.delete_phone(0)
      expect(test_contact.phone()).to(eq(["Another Fake Phone"]))
    end
  end
  
  describe("#edit_phone") do
    it("edits a phone") do
      test_contact = @@create_contact.call(:phone, "Fake Phone")
      test_contact.edit_phone(0, "Replacement Phone")
      expect(test_contact.phone()).to(eq(["Replacement Phone"]))
    end
  end
  
  describe("#add_email") do
    it("adds an email") do
      test_contact = @@create_contact.call(:email, "Fake Email")
      test_contact.add_email("Another Fake Email")
      expect(test_contact.email()).to(eq(["Fake Email", "Another Fake Email"]))
    end
  end
  
  describe("#delete_email") do
    it("deletes an email") do
      test_contact = @@create_contact.call(:email, "Fake Email")
      test_contact.add_email("Another Fake Email")
      test_contact.delete_email(0)
      expect(test_contact.email()).to(eq(["Another Fake Email"]))
    end
  end
  
  describe("#edit_email") do
    it("edits an email") do
      test_contact = @@create_contact.call(:email, "Fake Email")
      test_contact.edit_email(0, "Replacement Email")
      expect(test_contact.email()).to(eq(["Replacement Email"]))
    end
  end
end