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
    expect(page).to(have_content("John Smith"))
    expect(page).to(have_content("5555, Long Beach, CA 90210"))
    expect(page).to(have_content("(626) 555-5555"))
    expect(page).to(have_content("fake@aol.com"))
    expect(page).to(have_content("Certified Miner On-Duty"))
  end
end