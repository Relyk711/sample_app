#By using the symbol ':iser', we get factory girl to simulate the User model.

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :user do |user|
    user.name                   "Michael Hartl"
  user.sequence(:email)          {|n| "somebody_#{n}@example.com" }
    user.password               "foobar"
    user.password_confirmation  "foobar"
end


