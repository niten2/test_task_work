FactoryGirl.define do
  sequence :name do |n|
    "company#{n}"
  end

  factory :company do
    name
    country_code "US"
  end
end