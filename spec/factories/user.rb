FactoryGirl.define do
  factory :user do |f|
    f.email 'studenttest@test.com'
    f.password 'password'
    f.subscribed true
  end

end