35.times do |n|
  name  = Faker::Name.name
  email = "fake_email#{n+1}@mail.nope"
  password = "password"
  username = "FakeAcc #{n+1}"
  User.create!(username: username,
               name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
