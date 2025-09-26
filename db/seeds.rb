p "destroying all users"
User.destroy_all
p "users destroyed"

user.create(
  email: "clement@clement.fr",
  password: "password123",
  bio: "Hello world",
  street: "41 Rue petit parc",
  city: "Bordeaux",
  post_code: 33_200
)
