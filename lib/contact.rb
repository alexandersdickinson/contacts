class Contact
  attr_reader(:phone, :address)
  
  def initialize(attributes)
    @phone = attributes.fetch(:phone)
    @address = attributes.fetch(:address)
  end
end