class Contact
  attr_reader(:phone, :address, :email, :job_title)
  @@contacts = []
  
  def initialize(attributes)
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
end