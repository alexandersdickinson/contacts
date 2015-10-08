class Contact
  attr_reader(:phone, :address, :email, :job_title)
  @@contacts = []
  
  def initialize(attributes)
    @phone = attributes.fetch(:phone)
    @address = attributes.fetch(:address)
    @email = attributes.fetch(:email)
    @job_title = attributes.fetch(:job_title)
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