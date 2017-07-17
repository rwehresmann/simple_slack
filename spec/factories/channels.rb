FactoryGirl.define do
 factory :channel do
   slug "channel"
   team 
   user { team.user }
 end
end
