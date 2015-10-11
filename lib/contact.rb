class Contact
  attr_reader(:id, :first_name, :last_name, :phone, :address, :email, :job_title)
  @@contacts = []
  
  def initialize(attributes)
    @id = @@contacts.length() + 1
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @phone = []
    @phone.push(attributes.fetch(:phone))
    @address = []
    @address.push(attributes.fetch(:address))
    @email = []
    @email.push(attributes.fetch(:email))
    @job_title = attributes.fetch(:job_title)
  end
  
  def add_phone(phone)
    @phone.push(phone)
  end
  
  def add_address(address)
    @address.push(address)
  end
  
  def add_email(email)
    @email.push(email)
  end
  
  def save()
    @@contacts.push(self)
  end
  
  def self.all()
    @@contacts
  end
  
  def self.clear()
    @@contacts = []
  end
  
  def self.find(id)
    @@contacts.each() do |contact|
      return contact if contact.id() == id
    end
  end
end