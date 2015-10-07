class Address
  attr_reader(:street_address, :city, :state, :zip_code)
  
  def initialize(attributes)
    @street_address = attributes.fetch(:street_address)
    @city = attributes.fetch(:city)
    @state = attributes.fetch(:state)
    @zip_code = attributes.fetch(:zip_code)
  end
end