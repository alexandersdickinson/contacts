class Contact
  attr_reader(:phone, :address, :email, :job_title)
  
  def initialize(attributes)
    @phone = attributes.fetch(:phone)
    @address = attributes.fetch(:address)
    @email = attributes.fetch(:email)
    @job_title = attributes.fetch(:job_title)
  end
end