#By using the symbol ':iser', we get factory girl to simulate the User model.

Factory.define :user do |user|
    user.name                   "Michael Hartl"
    user.email                  "mhartl@example.com"
    user.password               "foobar"
    user.password_confirmation  "foobar"
end
