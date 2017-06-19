User.create!(name: "Phan Van Sanh",
  email: "example@railstutorial.org",
  password: "foobar",
  password_confirmation: "foobar",
  phone: "0962388514",
  address: "Lien Chieu, Da Nang",
  is_admin: true)

50.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@ecommerce.vn"
  password = "password"
  phone = "0123456789"
  address = Faker::Address.state
  User.create!(name: name,
    email: email,
    password: password,
    password_confirmation: password,
    phone: phone,
    address: address)
end
