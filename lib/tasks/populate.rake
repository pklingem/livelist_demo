namespace :db do
  task :populate => :environment do
    states = ['happy', 'sad', 'angry', 'content']
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
end
