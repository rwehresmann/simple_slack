FactoryGirl.define do
 factory :user do
   name "name"
   email { FFaker::Internet.email }
   password "secret123"
 end
end
