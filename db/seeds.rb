# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
50.times do
  company = Company.create(name: Faker::Company.name, country_code: Faker::Address.country_code)
  rand(2..10).times do
    company.persons.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  end
end