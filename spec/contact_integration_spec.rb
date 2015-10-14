require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("the new contact path", :type => :feature) do
  it("creates a new contact") do
    visit('/')
    click_link("New")
    fill_in('first_name', :with => "John")
    fill_in('last_name', :with => "Smith")
    fill_in('street_address', :with => "5555 Ersatz Ave.")
    fill_in('city', :with => "Long Beach")
    fill_in('state', :with => "CA")
    fill_in('zip_code', :with => 90210)
    fill_in('area_code', :with => "626")
    fill_in('first_three_digits', :with => "555")
    fill_in('last_four_digits', :with => "5555")
    choose("Mobile")
    fill_in('email', :with => "fake@aol.com")
    fill_in('job_title', :with => "Certified Miner On-Duty")
    click_button("Save Contact")
    click_link("Smith, John")
    expect(page).to(have_content("Smith, John"))
    expect(page).to(have_content("5555 Ersatz Ave. Long Beach, CA 90210"))
    expect(page).to(have_content("(626) 555-5555"))
    expect(page).to(have_content("fake@aol.com"))
    expect(page).to(have_content("Certified Miner On-Duty"))
  end
  
  it("lists contacts alphabetically according to last name") do
    visit('/')
    click_link("New")
    fill_in('first_name', :with => "Bob")
    fill_in('last_name', :with => "Porter")
    fill_in('street_address', :with => "5555")
    fill_in('city', :with => "Long Beach")
    fill_in('state', :with => "CA")
    fill_in('zip_code', :with => 90210)
    fill_in('area_code', :with => "626")
    fill_in('first_three_digits', :with => "555")
    fill_in('last_four_digits', :with => "5555")
    choose("Mobile")
    fill_in('email', :with => "fake@aol.com")
    fill_in('job_title', :with => "Certified Miner On-Duty")
    click_button("Save Contact")
    expect(page).to(have_content("Porter, Bob Smith, John"))
  end
end

describe("the attribute creation path", :type => :feature) do
  it("adds a phone number to an existing contact") do
    visit('/')
    click_link("Smith, John")
    fill_in('area_code', :with => "626")
    fill_in('first_three_digits', :with => "555")
    fill_in('last_four_digits', :with => "0199")
    choose("Mobile")
    click_button("add-phone")
    expect(page).to(have_content("(626) 555-0199"))
  end
  
  it("adds an address to an existing contact") do
    visit('/')
    click_link("Smith, John")
    fill_in('street_address', :with => "4444 East Fake St.")
    fill_in('city', :with => "Huntington Beach")
    fill_in('state', :with => "CA")
    fill_in('zip_code', :with => 65810)
    click_button("Add Address")
    expect(page).to(have_content("4444 East Fake St. Huntington Beach, CA 65810"))
  end
  
  it("adds an email address to an existing contact") do
    visit('/')
    click_link("Smith, John")
    fill_in('email', :with => "ersatz@gmail.com")
    click_button("Add Email")
    expect(page).to(have_content("ersatz@gmail.com"))
  end
end

describe("the attribute deletion path", :type => :feature) do
  it("deletes a phone number from an existing contact") do
    visit('/')
    click_link("Smith, John")
    click_button("phone-delete1")
    expect(page).to(have_content("(626) 555-5555"))
    expect(page).not_to(have_content("(626) 555-0199"))
  end
end