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

25.times do |n|
  name  = "App store"
  price = Faker::Number.number(5) + "00.0"
  image = "https://cdn4.iconfinder.com/data/icons/iconsimple-logotypes/512/app_store-512.png"
  description = "An app store (or app marketplace) is a type of digital distribution platform for computer software"
  subcategory_id = #{n+1}
  quantity = "15"
  views = "5"
  rating_id = #{n}
  Product.create!(name: name,
    price: price,
    image: image,
    description: description,
    subcategory_id: subcategory_id,
    quantity: quantity,
    views: views,
    rating_id: rating_id)
end
