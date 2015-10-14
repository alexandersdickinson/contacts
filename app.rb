require('sinatra')
require('sinatra/reloader')
require('./lib/contact')
require('./lib/address')
require('./lib/phone_number')
also_reload('lib/**/*.rb')

get('/') do
  @header = "Contacts"
  @contacts = Contact.all()
  erb(:index)
end

get('/new') do
  @header = "New Contact"
  erb(:new)
end

post('/') do
  phone_num = PhoneNumber.new({:area_code => params.fetch('area_code').to_i(), :number => (params.fetch('first_three_digits') + params.fetch('last_four_digits')).to_i(), :type => params.fetch('phone_type')})
  address = Address.new({:street_address => params.fetch('street_address'), :city => params.fetch('city'), :state => params.fetch('state'), :zip_code => params.fetch('zip_code').to_i()})
  contact = Contact.new({:first_name => params.fetch('first_name'), :last_name => params.fetch('last_name'), :phone => phone_num, :address => address, :email => params.fetch('email'), :job_title => params.fetch('job_title')})
  contact.save()
  @header = "Contacts"
  @contacts = Contact.all()
  erb(:index)
end

get('/:id') do
  @contact = Contact.find(params.fetch('id').to_i())
  @phone_numbers = @contact.phone()
  @addresses = @contact.address()
  @emails = @contact.email()
  @header = "#{@contact.last_name()}, #{@contact.first_name()}"
  erb(:contact)
end

post('/:id/new_phone') do
  @contact = Contact.find(params.fetch('id').to_i())
  new_phone = PhoneNumber.new({:area_code => params.fetch('area_code').to_i(), :number => (params.fetch('first_three_digits') + params.fetch('last_four_digits')).to_i(), :type => params.fetch('phone_type')})
  @contact.add_phone(new_phone)
  @phone_numbers = @contact.phone()
  @addresses = @contact.address()
  @emails = @contact.email()
  @header = "#{@contact.last_name()}, #{@contact.first_name()}"
  erb(:contact)
end

post('/:id/new_address') do
  @contact = Contact.find(params.fetch('id').to_i())
  address = Address.new({:street_address => params.fetch('street_address'), :city => params.fetch('city'), :state => params.fetch('state'), :zip_code => params.fetch('zip_code').to_i()})
  @contact.add_address(address)
  @phone_numbers = @contact.phone()
  @addresses = @contact.address()
  @emails = @contact.email()
  @header = "#{@contact.last_name()}, #{@contact.first_name()}"
  erb(:contact)
end

post('/:id/new_email') do
  @contact = Contact.find(params.fetch('id').to_i())
  @contact.add_email("ersatz@gmail.com")
  @phone_numbers = @contact.phone()
  @addresses = @contact.address()
  @emails = @contact.email()
  @header = "#{@contact.last_name()}, #{@contact.first_name()}"
  erb(:contact)
end

post('/:id/delete_phone') do
  @contact = Contact.find(params.fetch('id').to_i())
  @contact.delete_phone(params.fetch('phone-delete-form').to_i())
  @phone_numbers = @contact.phone()
  @addresses = @contact.address()
  @emails = @contact.email()
  @header = "#{@contact.last_name()}, #{@contact.first_name()}"
  erb(:contact)
end