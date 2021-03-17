new_user = User.create(email:"test@test.com", password:"password1")
user = User.first

@product1 = user.products.find_or_create_by(name: "Cleanser", quantity: 20, details: "Skin care")

