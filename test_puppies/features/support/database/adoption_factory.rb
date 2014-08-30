require_relative 'puppy'

FactoryGirl.define do
  factory :order do
    # name 'Cheezy'
    name Faker::Name.name
	  # address '123 Main'
    address Faker::Address.street_address
	  # email 'cheezy@me.com'
    email Faker::Internet.email
	  pay_type 'Check'
  end

  factory :adoption do
    association :order
	  puppy Puppy.find_by_name('Hanna')
  end
end

World(FactoryGirl::Syntax::Methods)