# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :building do
    street "MyString"
    city "MyString"
    state "MyString"
    zip_code 1
    description "MyText"
  end
end
