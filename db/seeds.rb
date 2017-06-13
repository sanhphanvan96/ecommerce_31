User.create!(name: "Phan Van Sanh",
  email: "sanhphanvan96@gmail.com",
  password: "123456",
  password_confirmation: "123456",
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

10.times do |n|
  name  = "Product A"
  price = Faker::Number.number(5) + "00"
  image = "https://cnet4.cbsistatic.com/img/H1Tl_QQs4Pes5sdj3ub1j3oxAiU=/770x433/2016/10/27/6cd01ecb-40cd-4615-b5f5-82993fbf9419/apple-macbook-pro-13-inch-2016-1765-026.jpg"
  description = "An app store (or app marketplace) is a type of digital distribution platform for computer software"
  subcategory_id = #{n+1}
  quantity = "5"
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

10.times do |n|
  name  = "Product B"
  price = Faker::Number.number(5) + "00"
  image = "https://cnet4.cbsistatic.com/img/H1Tl_QQs4Pes5sdj3ub1j3oxAiU=/770x433/2016/10/27/6cd01ecb-40cd-4615-b5f5-82993fbf9419/apple-macbook-pro-13-inch-2016-1765-026.jpg"
  description = "An app store (or app marketplace) is a type of digital distribution platform for computer software"
  subcategory_id = #{n+1}
  quantity = "10"
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

10.times do |n|
  name  = "Product C"
  price = Faker::Number.number(5) + "00"
  image = "https://cnet4.cbsistatic.com/img/H1Tl_QQs4Pes5sdj3ub1j3oxAiU=/770x433/2016/10/27/6cd01ecb-40cd-4615-b5f5-82993fbf9419/apple-macbook-pro-13-inch-2016-1765-026.jpg"
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

Category.create!(
  name: "Electronic",
  description: "Electronic")
Category.create!(parent_id: "1",
  name: "Phone",
  description: "Phone")
Category.create!(parent_id: "1",
  name: "Laptop",
  description: "Electronic")
Category.create!(
  name: "Book",
  description: "Book")
Category.create!(parent_id: "2",
  name: "Nokia",
  description: "Nokia")

products = Product.all
product_a = products[1..10]
product_b = products[11..20]
product_c = products[21..30]

product_a.each {|p|
  ProductCategory.create!(
    product_id: p.id,
    category_id: "3")
}
product_b.each {|p|
  ProductCategory.create!(
    product_id: p.id,
    category_id: "4")
}
product_c.each {|p|
  ProductCategory.create!(
    product_id: p.id,
    category_id: "5")
}
