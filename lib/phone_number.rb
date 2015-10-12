class PhoneNumber
  attr_reader(:area_code, :number, :type)
  
  def initialize(attributes)
    @area_code = attributes.fetch(:area_code)
    @number = attributes.fetch(:number)
    @type = attributes.fetch(:type)
  end
  
  def to_s()
    number = @number.to_s()
    number = number.split('').insert(3, '-').join('')
    "#{@type.capitalize()}: (#{@area_code}) #{number}"
  end
end