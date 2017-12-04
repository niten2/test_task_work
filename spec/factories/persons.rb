FactoryGirl.define do
  sequence :first_name do |n|
    "name#{n}"
  end

  factory :person do
    first_name
    last_name "Family"
    company
  end
end