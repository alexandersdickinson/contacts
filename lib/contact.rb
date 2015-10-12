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
  
  def delete_phone(index)
    @phone.delete_at(index)
  end
  
  def edit_phone(index, replacement)
    @phone[index] = replacement
  end
  
  def add_address(address)
    @address.push(address)
  end
  
  def delete_address(index)
    @address.delete_at(index)
  end
  
  def edit_address(index, replacement)
    @address[index] = replacement
  end
  
  def add_email(email)
    @email.push(email)
  end
  
  def delete_email(index)
    @email.delete_at(index)
  end
  
  def edit_email(index, replacement)
    @email[index] = replacement
  end
  
  def save()
    @@contacts.push(self)
    Contact.alpha_sort(@@contacts)
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
  
  def self.alpha_sort(collection)
    collection.sort! do |a,b|
      name1 = a.last_name().split('')
      name2 = b.last_name().split('')
      char1 = ''
      char2 = ''
      name1.each_index() do |i|
        break if i >= name2.length()
        char1 = name1[i].upcase()
        char2 = name2[i].upcase()
        if char1 == char2
          next
        else
          break
        end
      end
      if char1 > char2
        1
      elsif a == b
        0
      else
        -1
      end
    end
  end
end