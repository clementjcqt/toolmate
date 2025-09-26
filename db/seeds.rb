p "destroying all users"
User.destroy_all
p "users destroyed"

User.create(
  email: "clement@clement.fr",
  name: "Clément",
  password: "password123",
  bio: "Hello world",
  street: "41 Rue petit parc",
  city: "Bordeaux",
  post_code: 33_200
)
