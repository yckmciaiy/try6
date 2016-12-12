User.create!(
  name: "Admin",
  username: "Admin",
  email: "admin@admin.admin",
  password: "admin1",
  password_confirmation: "admin1",
  admin: true
)

Formula.create!(
  id: 1,
  user_id: 1,
  title: 'Glicko',
  glicko: true,
  winstreak: true,
  losestreak: true,
  winstreak_boost: 2.0,
  losestreak_boost: 2.0,
  use_extra_params: false,
  extra_points: 0
)
Formula.create!(
  id: 2,
  user_id: 1,
  title: 'Elo',
  glicko: false,
  winstreak: false,
  losestreak: false,
  winstreak_boost: 2.0,
  losestreak_boost: 2.0,
  use_extra_params: false,
  extra_points: nil
)
formula3 = Formula.create!(
  id: 3,
  user_id: 1,
  title: 'Elo with extra params',
  glicko: false,
  winstreak: false,
  losestreak: false,
  winstreak_boost: 2.0,
  losestreak_boost: 2.0,
  use_extra_params: true,
  extra_points: 50
)
formula3.extra_params.create!(
  id: 1,
  formula_id: 3,
  title: "gpm",
  weight: 10
)
formula3.extra_params.create!(
  id: 2,
  formula_id: 3,
  title: "xpm",
  weight: 4
)
formula3.extra_params.create!(
  id: 3,
  formula_id: 3,
  title: "3rd extra param",
  weight: 1
)

35.times do |n|
  name = Faker::Name.name
  email = "fake_email#{n+1}@mail.nope"
  password = "password"
  username = "FakeAcc #{n+1}"
  User.create!(username: username,
               name: name,
               email: email,
               password: password,
               password_confirmation: password)
end
