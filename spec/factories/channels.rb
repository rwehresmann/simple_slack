FactoryGirl.define do
 factory :channel do
   slug "channel"
   team dependent: :destroy
   user { team.user }
 end
end
