Given /^(\d+) users exist in the database$/ do |number_of_users|
  states = ['active','inactive','deleted']
  100.times do
    user = User.create(
      :first_name => Faker::Name.first_name,
      :last_name => Faker::Name.last_name,
      :street => Faker::Address.street_address,
      :city => Faker::Address.city,
      :state => Faker::Address.state,
      :zip_code => Faker::Address.zip_code,
      :status => states[rand(states.size)]
    )
  end
end

And /^debug$/ do
  debugger
end

Then /^I wait for ajax requests to complete$/ do
  page.wait_until(5) do
    page.evaluate_script 'jQuery.active == 0'
  end
end

Given /^I visit the users index page$/ do
  visit users_path
end

Then /^I should see (\d+) users$/ do |number_of_users|
  page.should have_css("ul#users li", :count => 30)
end

Then /^I should see pagination links$/ do
  page.should have_css('#pagination .pagination')
end

Then /^I should see filters$/ do
  page.should have_css('#filters .filter', :count => 2)
end
