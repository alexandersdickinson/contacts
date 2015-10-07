class Address
  attr_reader(:street_address)
  
  def initialize(attributes)
    @street_address = attributes.fetch(:street_address)
  end
end